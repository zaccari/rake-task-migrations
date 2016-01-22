class Rake::Migrations::Configuration

  DEFAULT_FILE_PATH = Rails.root.join('config', 'tasks.yml')

  def self.load(file_path = DEFAULT_FILE_PATH)
    config = new(file_path)
    config.load
    config
  end

  attr_reader :file_path, :tasks

  def initialize(file_path)
    @file_path = file_path
    @tasks = []
  end

  def load
    config = YAML.load_file(file_path).with_indifferent_access
    (config[:tasks] || []).each do |task|
      add_task Rake::Migrations::Task.new(*task)
    end
  end

  def add_task(task)
    @tasks << task unless @tasks.include?(task)
  end

end