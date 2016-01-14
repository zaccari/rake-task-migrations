class Rake::Migrations::Manifest

  DEFAULT_FILE_PATH = Rails.root.join('.rake.migrations.yml')

  def self.load(file_path = DEFAULT_FILE_PATH)
    manifest = new(file_path)
    manifest.load
    manifest
  end

  attr_reader :file_path, :tasks

  def initialize(file_path)
    @file_path = file_path
    @tasks     = []
  end

  def add_task(task)
    @tasks << task unless @tasks.include?(task)
  end

  def update(task)
    add_task(task)
    save
  end

  def load
    manifest = YAML.load_file(file_path)
    (manifest[:tasks] || []).each do |task|
      add_task(task)
    end
  rescue Errno::ENOENT
  end

  def save
    File.open(file_path, 'w') { |f| f.write to_yaml  }
  end

  def to_h
    {
      tasks: tasks
    }
  end
  alias_method :to_hash, :to_h

  def to_yaml
    to_hash.to_yaml
  end

end