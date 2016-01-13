namespace :tasks do

  task :migrate => :environment do
    Rake::Migrations.run_task_migrations
  end

end