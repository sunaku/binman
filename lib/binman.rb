require "binman/version"

module BinMan
  extend self

  # Extracts content of leading comment header (which can be one of the
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
  def load source=nil
    header = read(source)

    # strip shebang and encoding comments
    [/\A#!.+$/, /\A#.*coding:.+$/].each do |comment|
      header = $'.lstrip if header =~ comment
    end

    if header =~ /\A#/
      header.split(/^\s*$/, 2).first.gsub(/^# ?/, '')
    else
      header[/^=begin\b.*?$(.*?)^=end\b.*?$/m, 1]
    end.strip
  end

  # Converts given markdown(7) source into roff(7).
  def conv source=nil
    require 'md2man'
    Md2Man::ENGINE.render(read(source))
  rescue LoadError
    raise 'Run `gem install binman --development` to use BinMan::conv().'
  end

  # Extracts leading comment header content from given
  # source and returns the roff(7) conversion thereof.
  def dump source=nil
    conv load(source)
  end

  # Shows leading comment header from given source as UNIX man page if
  # possible, else falls back to showing leading comment header as-is.
  def show source=nil
    # try showing existing man page files for given source
    return if file = find(source) and File.exist? file and
      File.exist? man_path = File.expand_path('../../man', file) and
      system 'man', '-M', man_path, '-a', File.basename(file)

    header = load(source)

    begin
      roff = conv(header)
      require 'tempfile'
      Tempfile.open 'binman' do |temp|
        temp.write roff
        temp.close
        system 'man', temp.path
      end
    rescue => error
      warn "binman: #{error}"
      puts header
    end
  end

  # Shows leading comment header from given source as UNIX man page and exits
  # if the given argument vector contains '-h' or '--help', except after '--'.
  def help source=nil, argv=ARGV
    limit = argv.index('--') || argv.length
    index = [argv.index('-h'), argv.index('--help')].compact.min
    if index and index < limit
      show source
      exit
    end
  end

private

  # Returns contents of given source I/O, file name, or string.
  def read source=nil
    if source.respond_to? :read
      source.read
    elsif file = find(source) and File.exist? file
      File.read file
    else
      source
    end
  end

  # Resolves given source into first caller's file name if nil.
  def find source=nil
    source || if first_caller = caller.find {|f| not f.start_with? __FILE__ }
      first_caller.sub(/:\d+.*$/, '')
    end
  end
end
