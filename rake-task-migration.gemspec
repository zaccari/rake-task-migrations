# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rake/task_migration/version'

Gem::Specification.new do |spec|
  spec.name          = "rake-task-migration"
  spec.version       = Rake::TaskMigration::VERSION
  spec.authors       = ["Michael Zaccari"]
  spec.email         = ["michael.zaccari@gmail.com"]

  spec.description   = %q{Rails gem for rake task migrations}
  spec.summary       = %q{Rake Task Migrations}
  spec.homepage      = "https://github.com/mzaccari/rake-task-migration"
  spec.license       = "MIT"

  spec.files         = Dir["{app,db,lib}/**/*"] + ["LICENSE.txt", "Rakefile", "README.md"]

  spec.add_dependency 'rails', ['>= 3.2', '< 6']
end
