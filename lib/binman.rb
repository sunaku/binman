require 'shellwords'
require 'binman/version'

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
  def snip source=nil
    header = read(source)

    # strip shebang and encoding comments
    header.sub! /\A#!.+\n?/, ''
    header.sub! /\A#.*coding:.+\n?/, ''

    # extract the leading comment header
    if header =~ /\A\s*^#/
      header.split(/^\s*$/, 2).first.gsub(/^# ?/, '')
    else
      header[/^=begin\b.*?$(.*?)^=end\b.*?$/m, 1].to_s
    end.strip
  end

  # Extracts leading comment header content from given
  # source and returns the roff(7) conversion thereof.
  def dump source=nil
    conv snip(source)
  end

  # Shows leading comment header from given source as UNIX man page and
  # optionally jumps to first match of query regular expression if given.
  # If not possible, falls back to showing leading comment header as-is.
  # Tries to display a pre-rendered UNIX man page under ./man/ if possible.
  def show source=nil, query=nil
    # try showing existing man page files for given source
    if file = find(source) and File.exist? file
      man_page = File.basename(file)
      man_path = File.expand_path('../../man', file)

      # try showing roff manual page in man(1) reader in foreground;
      # close STDERR to avoid interference with the fall back below
      return if view query, '-M', man_path, '-a', man_page, 2 => :close

      # try showing HTML manual page in a web browser in background
      require 'opener'
      Dir["#{man_path}/**/#{man_page}.*.html"].each do |man_html|
        # close streams to avoid interference with man(1) reader below
        begin
          Opener.spawn man_html, 0 => :close, 1 => :close, 2 => :close
        rescue Errno::ENOENT
          # designated opener program could not be found on this system
        end
      end
    end

    # fall back to rendering leading comment header or showing it as-is
    header = snip(source)

    begin
      roff = conv(header)
      require 'tempfile'
      Tempfile.open 'binman' do |temp|
        temp.write roff
        temp.close
        return if view query, temp.path, 2 => :close
      end
    rescue => error
      warn "binman: #{error}"
    end

    puts header
  end

  # Shows leading comment header from given source as UNIX man page and exits
  # if the given argument vector contains '-h' or '--help', except after '--',
  # optionally followed by a regular expression argument that specifies text
  # to search for and, if found, jump to inside the displayed UNIX man page.
  def help source=nil, argv=ARGV
    limit = argv.index('--') || argv.length
    index = [argv.index('-h'), argv.index('--help')].compact.min
    if index and index < limit
      show source, argv[index + 1]
      exit
    end
  end

private

  # Launches man(1) with the given arguments and then tries to search for the
  # query (if given) within.  If man(1) is not able to launch with the search
  # capability, then it tries launching man(1) without the search capability.
  def view query, *argv
    # man(1) defaults to `pager -s` under Debian but `less -is` under CentOS
    # so try different pagers, but always fall back to using no pager at all.
    # See https://www.debian-administration.org/article/246/ for pager list.
    query and %w[ pager less most more ].any? do |pager|
      # the `-s` and `+/pattern` options are universally supported by pagers
      system 'man', '-P', "#{pager} -s +/#{query.shellescape}", *argv
    end or system 'man', *argv
  end

  # Converts given markdown(7) source into roff(7).
  def conv source=nil
    require 'md2man/roff/engine'
    Md2Man::Roff::ENGINE.render(read(source))
  rescue LoadError
    raise 'Run `gem install md2man` to use BinMan::dump() or BinMan::show().'
  end

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
