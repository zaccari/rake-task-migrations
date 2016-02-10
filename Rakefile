Dir['lib/tasks/*.rake'].each { |rake| load rake }

require 'bundler'
Bundler::GemHelper.install_tasks

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec)

task test: :spec

begin
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new
rescue LoadError
  desc 'Run RuboCop'
  task :rubocop do
    $stderr.puts 'Rubocop is disabled'
  end
end

task default: [:spec, :rubocop]

APP_RAKEFILE = File.expand_path("../spec/dummy/Rakefile", __FILE__)
load 'rails/tasks/engine.rake'

Bundler::GemHelper.install_tasks
