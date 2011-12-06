require 'rubygems'

class Gem::Specification
  alias _582ab9fd_ffc8_4972_b37f_1a46031a9163 initialize
  def initialize *args, &block
    _582ab9fd_ffc8_4972_b37f_1a46031a9163(*args, &block)

    # pre-build man page files
    require 'binman/rakefile'
    Rake::Task[:binman].invoke

    # and add them to the gem
    self.files += Dir['man/**/*']

    # add binman as dependency
    if self.name and self.name != 'binman'
      require 'binman/version'
      binman_gem = ['binman', "~> #{BinMan::VERSION[/\d+/]}"]
      self.add_runtime_dependency(*binman_gem)
      binman_vers = Gem::Dependency.new(*binman_gem)
      binman_spec = Gem::SpecFetcher.fetcher.fetch(binman_vers).flatten.first
      binman_spec.development_dependencies.unshift(binman_vers).each do |dep|
        self.add_development_dependency dep.name, dep.requirements_list
      end
    end
  end
end
