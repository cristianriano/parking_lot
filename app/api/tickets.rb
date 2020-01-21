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

          def render_ticket(ticket, mapping: SERIALIZER_MAPPING)
            MultiJson.dump(renderer.render(ticket, class: mapping))
          end
        end
      end
    end
  end
end
