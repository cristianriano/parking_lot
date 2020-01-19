# frozen_string_literal: true

require 'dry-types'

module Types
  include Dry::Types.module

  TicketID = Types::Strict::String.constrained(
    size: 16,
    format: /^[0-9a-fA-F]{16}$/
  )
end
