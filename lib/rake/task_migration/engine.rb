require 'rails'

module Rake
  module TaskMigration
    class Engine < ::Rails::Engine
      isolate_namespace Rake::TaskMigration
    end
  end
end
