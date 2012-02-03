# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "binman/version"

Gem::Specification.new do |s|
  s.name          = "binman"
  s.version       = BinMan::VERSION
  s.authors,
  s.email         = File.read('LICENSE').scan(/Copyright \d+ (.+) <(.+?)>/).transpose
  s.homepage      = "http://github.com/sunaku/binman"
  s.summary       = "UNIX man pages for Ruby bin/ scripts"
  s.description   = nil

  s.files         = `git ls-files`.split("\n") + Dir["man/**/*"]
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'md2man', '~> 1'
  s.add_development_dependency 'rake', '>= 0.9.2.2', '< 1'
end
