# frozen_string_literal: true

module Sinatra
  module Api
    module Tickets
      SERIALIZER_MAPPING = {
        'Models::Ticket': Serializers::Ticket
      }.freeze

      def self.registered(app)
        app.post '/tickets' do
          ticket = UseCases::Tickets::Create.new.call

          MultiJson.dump(renderer.render(ticket, class: SERIALIZER_MAPPING))
        end
      end
    end
  end
end
