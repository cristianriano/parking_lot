# frozen_string_literal: true

module UseCases
  module Tickets
    class Show < Base
      param :id, Types::TicketID

      def call
        ticket = fetch_ticket
        CalculatePrice.new(ticket).call
      end

      private

      def fetch_ticket
        Repositories::Ticket.find(id)
      end
    end
  end
end
