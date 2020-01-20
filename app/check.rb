# frozen_string_literal: true

module Sinatra
  module Check
    def self.registered(app)
      app.get '/check' do
        'OK'
      end
    end
  end
end
