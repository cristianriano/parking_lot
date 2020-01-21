# frozen_string_literal: true

require 'helpers/application_helper'
require 'check'
require 'api/api'

# Setup Sinatra API
module Sinatra
  class App < Base
    helpers ApplicationHelper

    register Namespace
    register Check
    register Api

    configure :production do
      enable :logging
      disable :raise_errors
      disable :show_exceptions
    end

    configure :test, :development do
      require 'pry'

      enable :logging
      enable :raise_errors
      disable :show_exceptions
    end

    before do
      content_type :json
    end

    error ::Errors::NotFound do |e|
      halt 404, e.message
    end

    error Dry::Types::ConstraintError, JSON::ParserError,
          Dry::Struct::Error do |e|
      halt 400, e.message
    end
  end
end
