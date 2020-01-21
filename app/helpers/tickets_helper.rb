# frozen_string_literal: true

module TicketsHelper
  SERIALIZER_MAPPING = {
    'Models::Ticket': Serializers::Ticket
  }.freeze

  def render_ticket(ticket, mapping: SERIALIZER_MAPPING)
    MultiJson.dump(renderer.render(ticket, class: mapping))
  end
end
