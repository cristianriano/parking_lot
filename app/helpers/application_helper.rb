# frozen_string_literal: true

require 'jsonapi/serializable/renderer'
require 'serializers/ticket'

# Share helper, common prupose
module ApplicationHelper
  SERIALIZER_MAPPING = {
    'Models::Ticket' => Serializers::Ticket
  }.freeze

  def renderer
    @renderer ||= JSONAPI::Serializable::Renderer.new
  end
end
