# frozen_string_literal: true

module Locator
  class Customer < Entry::Base
    extend Forwardable

    attr_accessor :name, :user_id
    attr_reader :latitude, :longitude

    def_delegators :location, :distance_to

    def latitude=(val)
      @location = nil
      @latitude = val
    end

    def longitude=(val)
      @location = nil
      @longitude = val
    end

    def location
      @location ||= Location.new(latitude, longitude)
    end
  end
end
