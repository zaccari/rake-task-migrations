require "rake"
require "rake/migrations/version"
require "rake/migrations/engine"

module Rake
  module Migrations

    def self.run_task_migrations
      get_task_migrations.each do |task|
        invoke task
      end
    end

    def self.get_task_migrations
      ['app:version']
    end

    def self.invoke(task)
      Rake::Task[task].invoke
    end

  end
end