# frozen_string_literal: true

module Locator
  class CLI
    def initialize(json_file)
      @json_file = json_file.to_s.strip

      raise ArgumentError, <<~BANNER.strip if @json_file.empty?
        JSON file is required

        Usage:
          bin/locator <path_to_json_file>
      BANNER
    end

    def run
      customers.near(dublin_office).sort_by(&:user_id).each do |customer|
        puts "#{customer.name} (user_id: #{customer.user_id})"
      end
    end

    private

    def customers
      @customers ||= Customers.new(@json_file)
    end

    def dublin_office
      @dublin_office ||= Location.new(53.339428, -6.257664)
    end
  end
end
