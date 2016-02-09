class Rake::Migrations::Migrator

  def self.run_task_migrations
    get_task_migrations.each do |task|
      invoke task
    end
  end

  # tasks that haven't been run yet
  def self.get_task_migrations
    config.tasks.select { |task| manifest.tasks.exclude?(task) }
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

  def invoke
    with_handler do
      Rake::Task[task.command].invoke
    end
  end

  def manifest
    self.class.manifest
  end

  private

  def with_handler(&block)
    announce "migrating"

    time = Benchmark.measure do
      block.call
    end

    announce "migrated (%.4fs)" % time.real;

    manifest.update(task)
  end

  def write(text)
    puts(text)
  end

  def say(message, subitem=false)
    write "#{subitem ? "   ->" : "--"} #{message}"
  end

  def announce(message)
    text = "#{task.name}: #{message}"
    length = [0, 75 - text.length].max
    write "== %s %s" % [text, "=" * length]
  end

end