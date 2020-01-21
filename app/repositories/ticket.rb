# frozen_string_literal: true

require 'connections/mysql'

module Repositories
  class Ticket
    class << self
      def insert(ticket)
        attrs = add_defaults(ticket)
        conn.insert(attrs)
        Models::Ticket.new(attrs)
      rescue Sequel::UniqueConstraintViolation
        raise Errors::EntityAlreadyExists, "ticket #{ticket.id}"
      end

      def find(id)
        row = conn.where(id: id).limit(1).first
        raise Errors::NotFound, id unless row

        Models::Ticket.new(row)
      end

      def update(id:, changeset:)
        ensure_present!(changeset)

        changeset[:updated_at] = Time.now
        find(id)
        conn.filter(id: id).update(**changeset)
        find(id)
      end

      private

      def add_defaults(ticket)
        now = Time.now
        ticket.to_h.tap do |attrs|
          attrs[:created_at] ||= now
          attrs[:updated_at] ||= now
          attrs[:state] ||= 'open'
        end
      end

      def ensure_present!(args)
        return if args&.any?

        raise ArgumentError, args
      end

      def conn
        @conn ||= Connections::Mysql.connection[:tickets]
      end
    end
  end
end
