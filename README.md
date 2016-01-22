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

TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mzaccari/rake-migrations.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

