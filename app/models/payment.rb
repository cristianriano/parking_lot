# frozen_string_literal: true

module Models
  class Payment < Base
    attr_accessor :ticket

    attribute :id,        Types::Integer
    attribute :payed_at,  Types::Strict::Time
    attribute :method,    Types::PaymentMethods
    attribute :ticket_id, Types::TicketID
  end
end
