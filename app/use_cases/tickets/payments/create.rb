# frozen_string_literal: true

module UseCases
  module Tickets
    module Payments
      class Create < Base
        param :id, Types::TicketID
        option :body, Types::Hash

        def call
          payment = build_payment
          Repositories::Payment.insert(payment)
          mark_ticket_as_paid
        end

        private

        def build_payment
          Models::Payment.new(
            id: SecureRandom.uuid,
            payed_at: Time.now,
            method: extract_payment_method,
            ticket_id: ticket.id
          )
        end

        def mark_ticket_as_paid
          Repositories::Ticket.update(
            id: ticket.id,
            changeset: { state: 'paid' }
          )
        end

        def extract_payment_method
          body.dig("payment", "method")
        end

        def ticket
          @ticket ||= Repositories::Ticket.find(id)
        end
      end
    end
  end
end
