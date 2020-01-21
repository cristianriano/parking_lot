# frozen_string_literal: true

module Models
  class Ticket < Base
    HOUR_FEE = 2

    attribute  :id,          Types::TicketID
    attribute  :created_at,  Types::Strict::Time
    attribute? :updated_at,  Types::Strict::Time.optional
    attribute? :state,       Types::TicketStates

    def price
      hours_elapsed.ceil * HOUR_FEE
    end

    def hours_elapsed
      (Time.now.utc - created_at) / 3600
    end
  end
end
