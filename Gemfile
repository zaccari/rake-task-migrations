source 'https://rubygems.org'

case ENV['DB']
when 'postgresql'
  gem 'pg'
when 'mysql'
  gem 'mysql2'
when 'sqlite'
  gem 'sqlite3'
else
  gem 'sqlite3'
end

group :test do
  gem 'database_cleaner', ['>= 1.2', '!= 1.4.0', '!= 1.5.0']
  gem 'factory_girl', '>= 4.2'
  gem 'rspec-rails', '>= 2.14'
  gem 'rubocop', '~> 0.31.0'
  gem 'codeclimate-test-reporter', require: nil
end

gemspec
