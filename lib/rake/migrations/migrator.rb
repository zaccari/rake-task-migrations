class Rake::Migrations::Migrator

  def self.run_task_migrations
    get_task_migrations.each do |task|
      invoke task
    end
  end

  # tasks to run every time + tasks that haven't been run yet
  def self.get_task_migrations
    ['app:version']
  end

  def self.manifest
    @manifest ||= Rake::Migrations::Manifest.load
  end

  def self.config
    @config ||= Rake::Migrations::Configuration.load
  end

  def self.invoke(task)
    new(task).invoke
  end

  attr_reader :task

  def initialize(task)
    @task = task
  end

  # call task
  # log to manifest
  def invoke
    with_handler do
      Rake::Task[task].invoke
    end
  end

  def manifest
    self.class.manifest
  end

  private

  def with_handler(&block)
    block.call
    manifest.update(task)
  rescue => e
    # log error
  end

end