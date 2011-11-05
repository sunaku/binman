require 'rubygems'

class Gem::Specification
  alias _582ab9fd_ffc8_4972_b37f_1a46031a9163 initialize
  def initialize *args, &block
    _582ab9fd_ffc8_4972_b37f_1a46031a9163(*args, &block)

    # pre-build man page files
    require 'binman/rake_tasks'
    Rake::Task[:binman].invoke

    # and add them to the gem
    self.files += Dir['man/**/*']
  end
end
