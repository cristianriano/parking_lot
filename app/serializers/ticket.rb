# frozen_string_literal: true

require 'serializers/base'

module Serializers
  class Ticket < Base
    type 'ticket'

    attribute_timestamp :created_at
  end
end
