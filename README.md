[![Gem Version](https://badge.fury.io/rb/rake-task-migration.svg)](https://badge.fury.io/rb/rake-task-migration)
[![Build Status](https://travis-ci.org/zaccari/rake-task-migrations.svg?branch=master)](https://travis-ci.org/zaccari/rake-task-migrations)
[![Maintainability](https://api.codeclimate.com/v1/badges/08bba999a702ca78e7b2/maintainability)](https://codeclimate.com/github/mzaccari/rake-task-migrations/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/08bba999a702ca78e7b2/test_coverage)](https://codeclimate.com/github/mzaccari/rake-task-migrations/test_coverage)

# Rake Task Migrations

Heavily based on the `seed_migration` gem [found here](https://github.com/harrystech/seed_migration).

For rails projects that need to run tasks on deployment that don't quite fit in the `db:migrate` and `seed:migrate` categories, this gem migrates specified rake tasks and ensures they only run once.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rake-task-migration'
```

And then execute:

    $ bundle

Install and run the internal migrations

    $ bundle exec rake task_migration:install:migrations
    $ bundle exec rake db:migrate

That will create the table to keep track of rake task migrations.

## Usage

Create the `lib/tasks/#{timestamp}_migration_namespace.rake` file using command:

    $ bundle exec rake tasks:generate migration_namespace

and add your tasks:

```ruby
namespace :migration_namespace do
  task :migrate_user_names => :environment do
    User.find_each do |user|
      user.update_attributes(name: "#{user.first_name} #{user.last_name}")
    end
  end
end
```

Then run the migration task:

```
$ bundle exec rake tasks:migrate
== migrate_user_names: migrating =============================================
== migrate_user_names: migrated (0.0191s) ====================================
```

Each rake task is run only once.

## Configuration

Use an initializer file for configuration.

### List of available configurations :

- `migration_table_name (default = 'rake_task_migrations')`
- `migration_namespace (default = :migrations)`

#### Example:

```ruby
# config/initializers/rake_task_migration.rb

Rake::TaskMigration.config do |config|
  config.migration_table_name = 'table_name'
  config.migration_namespace  = 'namespace'
end
```

## Runnings tests

```bash
export RAILS_ENV=test
export DB=mysql # or sqlite, postgresql
bundle exec rake app:db:create app:db:migrate
bundle exec rspec spec
```

* Rubies: 2.5, 2.6
* Rails: 5.0, 5.1, 5.2, 6.0
* Databases: MySQL, SQLite, PostgreSQL

For more information see the [travic-ci config](https://github.com/zaccari/rake-task-migrations/blob/master/.travis.yml).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
