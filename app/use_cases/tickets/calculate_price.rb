# frozen_string_literal: true

module UseCases
  module Tickets
    class CalculatePrice < Base
      HOUR_FEE = 2

      param :ticket, Models::Ticket

      def call
        ticket.price = price
        ticket
      end

      private

      def price
        case ticket.state
        when 'open'
          hours_elapsed.ceil * HOUR_FEE
        else
          0
        end
      end

      def hours_elapsed
        (Time.now.utc - ticket.created_at) / 3600
      end
    end
  end
end
