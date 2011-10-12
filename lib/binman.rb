require "binman/version"

module BinMan
  extend self

  ##
  # Returns the content of the leading comment header (which is a contiguous
  # sequence of single-line comments starting at the beginning of the file and
  # ending at the first single blank line) from the given source.
  #
  # Comment markers and the shebang line (if any) are removed from the result.
  #
  def read string
    string.split(/^\s*$/, 2).first.sub(/\A#!.+$/, '').gsub(/^# ?/, '').strip
  end

  ##
  # Shows leading comment header from given source as UNIX man page.
  #
  def show file=nil
    file ||= caller.first.sub(/:\d+.*$/, '')
    head = read(File.read(file))

    require 'redcarpet'
    require 'redcarpet/render_man'
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::ManPage)
    roff = markdown.render(head)
    IO.popen('man -l -', 'w') {|man| man.puts roff }
  end

  ##
  # Shows leading comment header from given file as UNIX man page and exits.
  #
  def help file=nil, argv=ARGV
    file ||= caller.first.sub(/:\d+.*$/, '')

    unless argv.grep(/^(-h|--help)$/).empty?
      show file
      exit
    end
  end
end
