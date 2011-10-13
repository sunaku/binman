require "binman/version"

module BinMan
  extend self

  ##
  # Returns content of leading comment header (which can be one of the
  # following two choices) from given source (IO, file name, or string).
  #
  # (1) A contiguous sequence of single-line comments starting at the
  #     beginning of the file (after shebang and encoding comments plus
  #     optional blank lines) and ending at the first single blank line.
  #
  # (2) First embedded document delimited by `=begin` and `=end` lines.
  #
  # Comment markers and shebang/encoding comments are omitted from result.
  #
  def read source=nil
    source = source.read if source.respond_to? :read
    source ||=
      if first_caller = caller.find {|f| not f.start_with? __FILE__ }
        first_caller.sub(/:\d+.*$/, '')
      end
    source = File.read(source) if File.exist? source

    string = source.to_s

    # strip shebang and encoding comments
    [/\A#!.+$/, /\A#.*coding:.+$/].each do |comment|
      string = $'.lstrip if string =~ comment
    end

    if string =~ /\A#/
      string.split(/^\s*$/, 2).first.gsub(/^# ?/, '')
    else
      string[/^=begin\b.*?$(.*?)^=end\b.*?$/m, 1]
    end.strip
  end

  ##
  # Converts given leading comment header (produced by #read) into roff(7).
  #
  def dump header
    require 'redcarpet-manpage'
    RedcarpetManpage::RENDERER.render(header)
  rescue LoadError
    raise 'Run `gem install binman --development` to use dump().'
  end

  ##
  # Shows leading comment header from given source as UNIX man page.
  #
  def show source=nil
    # try showing existing man page files for given source
    return if source and File.exist? source and
      File.exist? man_path = File.expand_path('../../man', source) and
      system 'man', '-M', man_path, '-a', File.basename(source)

    header = read(source)

    begin
      roff = dump(header)
      IO.popen('man -l -', 'w') {|man| man.puts roff }
    rescue => error
      warn "binman: #{error}"
      puts header
    end
  end

  ##
  # Shows leading comment header from given source as UNIX man page and exits.
  #
  def help source=nil, argv=ARGV
    unless argv.grep(/^(-h|--help)$/).empty?
      show source
      exit
    end
  end
end
