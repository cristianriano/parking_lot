# frozen_string_literal: true

ENV['RACK_ENV'] = ENV['APP_ENV'] = ENV['ENVIRONMENT'] ||= 'development'

require 'rubygems'
require 'bundler'

require 'dotenv'
Dotenv.load "./config/.env.#{ENV['ENVIRONMENT']}"

$LOAD_PATH.unshift(File.expand_path('../app', __dir__))

require 'sinatra/base'
require 'app'

# Require use_cases, helpers and models
Dir.glob('./app/{helpers}/**/*.rb')
   .each { |file| require file }
