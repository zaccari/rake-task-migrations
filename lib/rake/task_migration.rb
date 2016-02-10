require 'rake'
require 'rake/task_migration/version'
require 'rake/task_migration/engine'
require 'benchmark'

module Rake
  module TaskMigration
    autoload :Migrator, 'rake/task_migration/migrator'

    class << self
      mattr_accessor :migration_table_name
      mattr_accessor :migration_namespace

      self.migration_table_name = 'rake_task_migrations'
      self.migration_namespace  = :migrations

      def config
        yield self
      end

      def migrate
        Migrator.migrate(tasks)
      end

      def tasks
        with_namespace { |namespace| return namespace.tasks }
      end

      def with_namespace
        Rake.application.in_namespace(migration_namespace) do |namespace|
          yield namespace if block_given?
        end
      end
    end
  end
end
