# frozen_string_literal: true

module UseCases
  module Tickets
    class Create < Base
      def call
        store_ticket(build_ticket)
      end

      private

      def build_ticket
        Models::Ticket.new(
          id: SecureRandom.hex(8),
          created_at: Time.now.utc
        )
      end

      def store_ticket(ticket)
        Repositories::Ticket.insert(ticket)
      end
    end
  end
end
