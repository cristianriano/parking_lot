# frozen_string_literal: true

source 'https://rubygems.org'

# Framework and server related
gem 'puma', '~> 4.3'
gem 'rake', '~> 13.0'
gem 'racksh', '~> 1.0'
gem 'sinatra', '~> 2.0'

# Configuration
gem 'dotenv', '~> 2.7'

# Database
gem 'sequel', '~> 5.28'
gem 'mysql2'

# Validation
gem 'dry-initializer', '~> 3.0'
gem 'dry-struct', '~> 1.2'
gem 'dry-types', '~> 1.0'

group :test, :development do
  gem 'factory_bot', '~> 5.1'
  gem 'rubocop', '~> 0.76', require: false
end

group :test do
  gem 'pry', '~> 0.12'
  gem 'rack-test', '~> 1.1'
  gem 'rspec', '~> 3.9'
end
