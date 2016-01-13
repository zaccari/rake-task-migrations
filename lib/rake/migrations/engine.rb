require 'rails'

module Rake
  module Migrations
    class Engine < ::Rails::Engine
      isolate_namespace Rake::Migrations

    end
  end
end