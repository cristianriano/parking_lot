# frozen_string_literal: true

require 'jsonapi/serializable/resource'

module Serializers
  class Base < JSONAPI::Serializable::Resource
    # rubocop:disable Layout/LineLength
    def self.attribute_timestamp(attr, options = {}, &block)
      attr_name = attr.to_sym
      attribute(attr_name, options) do
        value = block_given? ? instance_eval(&block) : @object.public_send(attr_name)
        if value.is_a?(Time)
          value.to_i * 1000
        else
          value
        end
      end
    end
    # rubocop:enable Layout/LineLength
  end
end
