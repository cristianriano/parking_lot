# frozen_string_literal: true

require 'connections/mysql'

module Repositories
  class Ticket
    class << self
      def insert(ticket)
        conn.insert(ticket.to_h)
        ticket
      rescue Sequel::UniqueConstraintViolation
        raise Errors::EntityAlreadyExists, "ticket #{ticket.id}"
      end

      def find(id)
        row = conn.where(id: id).limit(1).first
        raise Errors::NotFound.new(id) unless row
        Models::Ticket.new(row)
      end

      private

      def conn
        @conn ||= Connections::Mysql.connection[:tickets]
      end
    end
  end
end
