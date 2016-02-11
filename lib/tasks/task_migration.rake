#:nocov:
namespace :tasks do
  task migrate: :environment do
    Rake::TaskMigration.migrate
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