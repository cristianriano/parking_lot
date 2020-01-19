# frozen_string_literal: true

require 'helpers/application_helper'

# Shared behaviour with other controllers
class ApplicationController < Sinatra::Base
  helpers ApplicationHelper

  configure :production do
    enable :logging
    disable :raise_errors
    disable :show_exceptions
  end

  configure :test, :development do
    require 'pry'

    enable :logging
    enable :raise_errors
    enable :show_exceptions
  end
end
