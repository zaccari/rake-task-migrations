<a href="https://codeclimate.com/github/mzaccari/rake-migrations"><img src="https://codeclimate.com/github/mzaccari/rake-migrations/badges/gpa.svg" /></a>

# Rake::Migrations

Heavily based on the `seed_migration` gem [found here](https://github.com/harrystech/seed_migration).

For rails projects that need to run tasks on deployment that don't quite fit in the `db:migrate` and `seed:migrate` categories, this gem lets you run configured rake tasks `once` or `every` time the command is run.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rake-migrations'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rake-migrations

## Usage

Given a set of rake tasks you might need to run on deployment:

```ruby
namespace :users do
  # Run this only once
  task :migrate_names => :environment do
    User.find_each do |user|
      user.update_attributes(name: "#{user.first_name} #{user.last_name}")
    end
  end
end

namespace :deployment do
  # Run this on each deployment
  task :restart_jboss => :environment do
    FileUtils.touch(Rails.root.join('tmp', 'restart.txt'))
  end
end
```

Create a file at `config/tasks.yml` with your rake migration configuration:

```yml
tasks:
  user_name_migration:
    command: users:migrate_names
    frequency: :once # default

  restart_jboss:
    command: deployment:restart_jboss
    frequency: :every
```

Then run the migration for your configured rake tasks:

```
$ bundle exec rake tasks:migrate
== user_name_migration: migrating =============================================
== user_name_migration: migrated (0.0191s) ====================================
== restart_jboss: migrating ===================================================
== restart_jboss: migrated (0.0005s) ==========================================
```

Notice that the user name task should only be run once. If we re-run the rake task migration it will not be included:
```
$ bundle exec rake tasks:migrate
== restart_jboss: migrating ===================================================
== restart_jboss: migrated (0.0003s) ==========================================
```




## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mzaccari/rake-migrations.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

