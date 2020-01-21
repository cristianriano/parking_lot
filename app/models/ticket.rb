# frozen_string_literal: true

module Models
  class Ticket < Base
    HOUR_FEE = 2

    attr_accessor :price

    attribute  :id,          Types::TicketID
    attribute  :created_at,  Types::Strict::Time
    attribute? :updated_at,  Types::Strict::Time.optional
    attribute? :state,       Types::TicketStates
  end
end
