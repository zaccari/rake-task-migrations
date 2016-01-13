namespace :tasks do

  task :migrate => :environment do
    Rake::Migrations::Migrator.run_task_migrations
  end

end