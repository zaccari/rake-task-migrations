#:nocov:
namespace :tasks do
  task migrate: :environment do
    Rake::TaskMigration.migrate
  end

  desc 'Generate an empty task file with timestamp, Usage => rake tasks:create task_name'
  task generate: :environment do
    argument = ARGV[1]
    task_name = "#{argument}_#{Time.now.to_formatted_s(:number)}.rake"
    puts "#{task_name}: generating"
    task_path = "lib/tasks/migrations/#{task_name}"
    FileUtils.touch(task_path)
    puts "#{task_name}: generated"
    exit
  end
end

namespace :task_migration do
  namespace :install do
    task :migrations do
      Rake::Task['rake_task_migration:install:migrations'].invoke
    end
  end
end
#:nocov:
