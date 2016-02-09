class Rake::Migrations::Configuration

  DEFAULT_NAMESPACE = :migrations

  def self.load(namespace = DEFAULT_NAMESPACE)
    config = new(namespace)
    config.load
    config
  end

  attr_reader :namespace, :tasks

  def initialize(namespace)
    @namespace = namespace
    @tasks     = []
  end

  def load
    Rake.application.in_namespace(namespace) do |namespace|
      namespace.tasks.each do |task|
        add_task Rake::Migrations::Task.new(task.name, command: task.name)
      end
    end
  end

  def add_task(task)
    @tasks << task unless @tasks.include?(task)
  end

end