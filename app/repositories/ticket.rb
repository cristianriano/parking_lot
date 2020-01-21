# frozen_string_literal: true

require 'connections/mysql'

module Repositories
  class Ticket
    class << self
      def insert(ticket)
        ticket = add_defaults(ticket)
        conn.insert(ticket.to_h)
        ticket
      rescue Sequel::UniqueConstraintViolation
        raise Errors::EntityAlreadyExists, "ticket #{ticket.id}"
      end

      def find(id)
        row = conn.where(id: id).limit(1).first
        raise Errors::NotFound, id unless row

        Models::Ticket.new(row)
      end

      private

      def add_defaults(ticket)
        now = Time.now
        ticket.new(
          created_at: now,
          updated_at: now,
          state: 'open'
        )
      end

      def conn
        @conn ||= Connections::Mysql.connection[:tickets]
      end
    end
  end
end
