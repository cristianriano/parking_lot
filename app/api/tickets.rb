# frozen_string_literal: true

module Sinatra
  module Api
    module Tickets
      def self.registered(app) # rubocop:disable Metrics/MethodLength
        app.helpers TicketsHelper

        app.namespace '/tickets' do
          post do
            ticket = UseCases::Tickets::Create.new.call
            render_ticket(ticket)
          end

          get '/:ticket_id' do |ticket_id|
            ticket = UseCases::Tickets::Show.new(ticket_id).call
            render_ticket(ticket)
          end

          post '/:ticket_id/payments' do |ticket_id|
            UseCases::Tickets::Payments::Create
              .new(ticket_id, body: parsed_body).call

            201
          end
        end
      end
    end
  end
end
