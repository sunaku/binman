require 'rake'

path = 'man/man1'
bins = FileList['bin/*']
mans = bins.pathmap("#{path}/%n.1")

bins.zip(mans).each do |bin, man|
  file man => [bin, path] do
    require 'binman'
    roff = BinMan.dump(bin)
    File.open(man, 'w') {|f| f << roff }
  end
end


desc 'Build UNIX man pages for bin/ scripts.'
task :binman => mans
directory path
