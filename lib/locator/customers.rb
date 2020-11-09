# frozen_string_literal: true

module Locator
  class Customers < Repo::JsonLines
    DEFAULT_RADIUS = 100 # km

    def initialize(file_path)
      super(Customer, file_path)
    end

    def near(location, radius: DEFAULT_RADIUS)
      find_all { |customer| customer.distance_to(location) <= radius }
    end
  end
end
