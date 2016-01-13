class Rake::Migrations::Configuration

  DEFAULT_FILE_PATH = Rails.root.join('config', 'tasks.yml')

  def self.load(file_path = DEFAULT_FILE_PATH)
    new(file_path).load
  end

  attr_reader :file_path

  def initialize(file_path)
    @file_path = file_path
  end

  def load
    puts "Loading config file at #{file_path}"
  end

end