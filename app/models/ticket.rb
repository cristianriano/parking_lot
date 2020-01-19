# frozen_string_literal: true

module Models
  class Ticket < Base
    attribute  :id,          Types::TicketID
    attribute  :created_at,  Types::Strict::Time
    attribute? :checkout_at, Types::Strict::Time.optional
  end
end
