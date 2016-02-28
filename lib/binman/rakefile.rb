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
    output = BinMan.text(src)
    File.open(dst, 'w') {|f| f << output }
  end
end

desc 'Extract manuals embedded in bin/ scripts.'
task 'binman:mkd' => mkds

#-----------------------------------------------------------------------------
desc 'Build UNIX manual pages for bin/ scripts.'
task 'binman:man' => 'binman:mkd' do
#-----------------------------------------------------------------------------
  sh 'md2man-rake', 'man'
end

#-----------------------------------------------------------------------------
desc 'Build HTML manual pages for bin/ scripts.'
task 'binman:web' => 'binman:mkd' do
#-----------------------------------------------------------------------------
  sh 'md2man-rake', 'web'
end
