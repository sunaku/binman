require 'binman'
require 'rake'

# build man pages before building ruby gem using bundler
if defined? Bundler::GemHelper
  %w[build install release].each {|t| task t => :binman }
end

#-----------------------------------------------------------------------------
desc 'Build manual pages for bin/ scripts.'
task :binman => ['binman:man', 'binman:web']
#-----------------------------------------------------------------------------

directory dir = 'man/man1'
bins = FileList['bin/*']
mkds = bins.pathmap("#{dir}/%n.1.markdown")

bins.zip(mkds).each do |src, dst|
  file dst => [dir, src] do
    output = BinMan.load(src)
    File.open(dst, 'w') {|f| f << output }
  end
end

#-----------------------------------------------------------------------------
desc 'Build UNIX manual pages for bin/ scripts.'
task 'binman:man' => mkds do
#-----------------------------------------------------------------------------
  BinMan.require_md2man
  load 'md2man/rakefile.rb'
  Rake::Task['md2man:man'].invoke
end

#-----------------------------------------------------------------------------
desc 'Build HTML manual pages for bin/ scripts.'
task 'binman:web' => mkds do
#-----------------------------------------------------------------------------
  BinMan.require_md2man
  load 'md2man/rakefile.rb'
  Rake::Task['md2man:web'].invoke
end
