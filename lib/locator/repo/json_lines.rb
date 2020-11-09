# frozen_string_literal: true

module Locator
  module Repo
    # Handles a file with JSON objects. One JSON object per line.
    #
    #   { "name": "John Doe", "user_id": 1}
    #   { "name": "Alan Smith", "user_id": 2}
    class JsonLines < Base
      attr_reader :file_path

      def initialize(entry_class, file_path)
        super(entry_class)

        @file_path = Pathname(file_path)
      end

      def load
        file_path.each_line.map(&JSON.method(:parse))
      end
    end
  end
end
