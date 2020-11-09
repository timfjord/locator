# frozen_string_literal: true

module Locator
  module Repo
    class JsonLines < Base
      attr_reader :json_file

      def initialize(entry_class, json_file)
        super(entry_class)

        @json_file = Pathname(json_file)
      end

      def load
        json_file.each_line.map(&JSON.method(:parse))
      end
    end
  end
end
