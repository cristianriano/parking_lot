# frozen_string_literal: true

require 'jsonapi/serializable'
require 'serializers/ticket'

# Share helper, common prupose
module ApplicationHelper
  def renderer
    @renderer ||= JSONAPI::Serializable::Renderer.new
  end
end
