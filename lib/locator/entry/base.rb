# frozen_string_literal: true

module Locator
  module Entry
    class Base
      def initialize(attrs = {})
        assign_attributes(attrs)
      end

      def assign_attributes(attrs = {})
        attrs.each do |key, value|
          writer = "#{key}="
          public_send(writer, value) if respond_to?(writer)
        end
      end
    end
  end
end
