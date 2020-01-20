# frozen_string_literal: true

module UseCases
  module Tickets
    class Show < Base
      param :id, Types::TicketID

      def call
        Repositories::Ticket.find(id)
      end
    end
  end
end
