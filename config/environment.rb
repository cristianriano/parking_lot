# frozen_string_literal: true

ENV['RACK_ENV'] = ENV['APP_ENV'] = ENV['ENVIRONMENT'] ||= 'development'

require 'rubygems'
require 'bundler'

require 'dotenv'
Dotenv.load "./config/.env.#{ENV['ENVIRONMENT']}"

$LOAD_PATH.unshift(File.expand_path("..", __dir__))
$LOAD_PATH.unshift(File.expand_path('../app', __dir__))

require 'sinatra/base'
require 'sinatra/namespace'
require 'types'
require 'errors'
require 'app'

Dir["config/initializers/**/*.rb"].sort.each do |filename|
  require filename
end

# Require use_cases, helpers and models
Dir.glob('./app/{use_cases,helpers,models,repositories}/**/*.rb')
   .each { |file| require file }
