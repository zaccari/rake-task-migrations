require "rake"
require "rake/migrations/version"
require "rake/migrations/engine"
require "yaml"

module Rake
  module Migrations
    autoload :Configuration, 'rake/migrations/configuration'
    autoload :Manifest,      'rake/migrations/manifest'
    autoload :Migrator,      'rake/migrations/migrator'

  end
end