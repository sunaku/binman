require 'rake'

directory path = 'man/man1'
bins = FileList['bin/*']
mans = bins.pathmap("#{path}/%n.1")

desc 'Build UNIX manual pages for bin/ scripts.'
task :binman => mans

bins.zip(mans).each do |bin, man|
  file man => [bin, path] do
    require 'binman'
    roff = BinMan.dump(bin)
    File.open(man, 'w') {|f| f << roff }
  end
end

# build man pages before building ruby gem using bundler
%w[build install release].each {|t| task t => :binman }
