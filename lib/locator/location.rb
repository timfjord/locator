# frozen_string_literal: true

module Locator
  class Location
    EARTH_RADIUS = 6371.009 # km

    using Refinements::ToRadians

    attr_accessor :longitude, :latitude

    def initialize(latitude, longitude)
      @latitude = latitude.to_f
      @longitude = longitude.to_f
    end

    def phi
      @phi ||= latitude.to_radians
    end

    def lambda
      @lambda ||= longitude.to_radians
    end

    # Calcualte the great-circle distance using the first formula
    # from https://en.wikipedia.org/wiki/Great-circle_distance#Formulae
    def distance_to(other)
      unless other.is_a?(self.class)
        raise ArgumentError, "Invalid argument, should be a #{self.class} instance"
      end

      delta_lambda = (other.lambda - lambda).abs

      delta_sigma = Math.acos(
        Math.sin(phi) * Math.sin(other.phi) +
        Math.cos(phi) * Math.cos(other.phi) * Math.cos(delta_lambda)
      )

      EARTH_RADIUS * delta_sigma
    end
  end
end
