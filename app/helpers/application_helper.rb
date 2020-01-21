# frozen_string_literal: true

require 'jsonapi/serializable'
require 'serializers/ticket'

# Share helper, common prupose
module ApplicationHelper
  def renderer
    @renderer ||= JSONAPI::Serializable::Renderer.new
  end

  def parsed_body
    @parsed_body ||= begin
      request.body.rewind
      JSON.parse(request.body.read)
    end
  end
end
