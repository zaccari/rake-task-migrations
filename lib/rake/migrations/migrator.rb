require 'rake'

class Rake::Migrations::Migrator

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

  def self.manifest
    @manifest ||= Rake::Migrations::Manifest.load
  end

  def self.config
    @config ||= Rake::Migrations::Configuration.load
  end

end