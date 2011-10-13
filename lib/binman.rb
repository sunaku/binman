require "binman/version"

module BinMan
  extend self

  ##
  # Returns content of leading comment header (a contiguous sequence of
  # single-line comments starting at beginning of file and ending at first
  # single blank line) from given source (IO, file name, or string).
  #
  # Comment markers and shebang line (if any) are removed from result.
  #
  def read source=nil
    source = source.read if source.respond_to? :read
    source ||=
      if first_caller = caller.find {|f| not f.start_with? __FILE__ }
        first_caller.sub(/:\d+.*$/, '')
      end
    source = File.read(source) if File.exist? source

    string = source.to_s
    string.split(/^\s*$/, 2).first.sub(/\A#!.+$/, '').gsub(/^# ?/, '').strip
  end

  ##
  # Converts given leading comment header (produced by #read) into roff(7).
  #
  def dump header
    require 'binman/renderer'
    RENDERER.render(header)
  end

  ##
  # Shows leading comment header from given source as UNIX man page.
  #
  def show source=nil
    # try showing pre-built man page for given source
    if source and File.exist? source
      bin = File.basename(source)
      man = File.expand_path("../../man/man1/#{bin}.1", source)
      return if system 'man', '-l', man if File.exist? man
    end

    header = read(source)

    begin
      roff = dump(header)
      IO.popen('man -l -', 'w') {|man| man.puts roff }
    rescue
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
