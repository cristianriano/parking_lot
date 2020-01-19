# frozen_string_literal: true

ENV['RACK_ENV'] = ENV['APP_ENV'] = ENV['ENVIRONMENT'] ||= 'development'

require 'rubygems'
require 'bundler'

$LOAD_PATH.unshift(File.expand_path('../app', __dir__))

require 'sinatra/base'

# Require controllers and helpers
Dir.glob('./app/{controllers,helpers}/*.rb')
   .each { |file| require file }
