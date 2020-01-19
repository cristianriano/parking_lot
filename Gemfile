# frozen_string_literal: true

source 'https://rubygems.org'

# Framework and server related
gem 'puma', '~> 4.3'
gem 'racksh', '~> 1.0'
gem 'sinatra', '~> 2.0'

# Database
gem 'sequel', '~> 5.28'

group :test, :development do
  gem 'rubocop', '~> 0.76', require: false
end

group :test do
  gem 'pry', '~> 0.12'
  gem 'rack-test', '~> 1.1'
  gem 'rspec', '~> 3.9'
end
