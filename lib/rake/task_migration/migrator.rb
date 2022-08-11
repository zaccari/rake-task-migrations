module Rake
  module TaskMigration
    class Migrator
      class << self
        def migrate(tasks)
          new(tasks).migrate
        end

        def get_all_tasks
          RakeTaskMigration.all.map { |x| x.version.to_s }.sort
        end
      end

      attr_reader :tasks

      def initialize(tasks)
        @tasks = Array(tasks)
      end

      def migrate
        pending_tasks.each { |task| migrate_task(task.name.to_s) }
      end

    private

      def migrate_task(task)
        fail "#{task} has already been migrated." if RakeTaskMigration.where(version: task).first

        announce "#{task}: migrating"

        with_optional_transaction_wrapper do
          time = Benchmark.measure do
            invoke(task)
          end

          # Create record
          migration = RakeTaskMigration.new
          migration.version = task
          migration.runtime = time.real.to_i
          migration.migrated_on = DateTime.now
          migration.save!

          announce "#{task}: migrated (#{format('%.4fs', time.real)})"
        end
      end

      def with_optional_transaction_wrapper
        if Rake::TaskMigration.wrap_migrations_in_transaction
          ActiveRecord::Base.transaction { yield }
        else
          yield
        end
      end

      def invoke(task)
        Rake::Task[task].invoke
      end

      def pending_tasks
        already_migrated = migrated
        tasks.reject { |task| already_migrated.include?(task.name) }
      end

      def migrated
        @migrated_tasks || load_migrated
      end

      def load_migrated
        @migrated_tasks = Set.new(self.class.get_all_tasks)
      end

      def write(text)
        puts text
      end

      def announce(text)
        length = [0, 75 - text.length].max
        write format('== %s %s', text, '=' * length)
      end
    end
  end
end
