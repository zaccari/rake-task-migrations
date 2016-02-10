Rails.application.routes.draw do
  mount Rake::TaskMigration::Engine => '/rake_task_migration'
end
