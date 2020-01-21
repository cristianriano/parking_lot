# frozen_string_literal: true

module Repositories
  class Ticket
    class << self
      def clear
        return unless %w[test development].include? ENV['ENVIRONMENT']

        conn.delete
      end

      def count
        conn.count
      end
    end
  end
end
