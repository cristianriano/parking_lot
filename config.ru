# frozen_string_literal: true

require File.expand_path('config/environment', __dir__)

mapping = { "/" => Sinatra::App }

run Rack::URLMap.new(mapping)
