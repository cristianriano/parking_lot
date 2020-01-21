# frozen_string_literal: true

require 'connections/mysql'

module Repositories
  class Payment
    class << self
      def insert(payment)
        conn.insert(payment.to_h)
        payment
      end

      private

      def conn
        @conn ||= Connections::Mysql.connection[:payments]
      end
    end
  end
end
