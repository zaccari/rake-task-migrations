# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rake/migrations/version'

Gem::Specification.new do |spec|
  spec.name          = "rake-migrations"
  spec.version       = Rake::Migrations::VERSION
  spec.authors       = ["Michael Zaccari"]
  spec.email         = ["michael.zaccari@gmail.com"]

  spec.description   = %q{Rails gem for rake task migrations}
  spec.summary       = %q{Rake Task Migrations}
  spec.homepage      = "https://github.com/mzaccari/rake-migrations"
  spec.license       = "MIT"

  s.files = Dir["lib/**/*"] + ["LICENSE.txt", "Rakefile", "README.md"]

  spec.add_development_dependency "rails", ">= 3.2"
end
