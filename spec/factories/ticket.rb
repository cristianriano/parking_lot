# frozen_string_literal: true

require 'models/ticket'

FactoryBot.define do
  factory :ticket, class: Models::Ticket do
    initialize_with do
      Models::Ticket.new(attributes)
    end

    id { SecureRandom.hex(8) }
    created_at { Time.now }

    to_create do |instance|
      Repositories::Ticket.insert(instance)
    end
  end
end
