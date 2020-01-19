# frozen_string_literal: true

require 'api/tickets'

module Sinatra
  module Api
    def self.registered(app)
      app.namespace '/api' do
        register Tickets
      end
    end
  end
end
