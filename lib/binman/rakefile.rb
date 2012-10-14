require 'rake'

directory dir = 'man/man1'
bins = FileList['bin/*']
mkds = bins.pathmap("#{dir}/%n.1.markdown")

desc 'Build manual pages for bin/ scripts.'
task :binman => ['binman:man', 'binman:web']

bins.zip(mkds).each do |src, dst|
  file dst => [dir, src] do
    require 'binman'
    output = BinMan.load(src)
    File.open(dst, 'w') {|f| f << output }
  end
end

desc 'Build UNIX manual pages for bin/ scripts.'
task 'binman:man' => mkds do
  require 'md2man/rakefile'
  Rake::Task['md2man:man'].invoke
end

desc 'Build HTML manual pages for bin/ scripts.'
task 'binman:web' => mkds do
  require 'md2man/rakefile'
  Rake::Task['md2man:web'].invoke
end

# build man pages before building ruby gem using bundler
%w[build install release].each {|t| task t => :binman }
