# frozen_string_literal: true

require 'serializers/base'

module Serializers
  class Ticket < Base
    extend JSONAPI::Serializable::Resource::ConditionalFields

    type 'ticket'

    attribute_timestamp :created_at
    attribute :price, if: -> { @object.price && @object.price.nonzero? }
  end
end
