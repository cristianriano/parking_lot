# frozen_string_literal: true

require 'sequel'

module Connections
  class Mysql
    def self.connection
      @connection ||= Sequel.connect(ENV['DATABASE_URL'])
    end
  end
end
