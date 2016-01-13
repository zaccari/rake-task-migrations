namespace :tasks do

  task :migrate => :environment do
    Rake::Migrations.run_migrations
  end

end