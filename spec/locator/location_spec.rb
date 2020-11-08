# frozen_string_literal: true

require 'spec_helper'

describe Locator::Location do
  describe "#phi" do
    let(:location) { described_class.new(90, 0) }

    it "converts the latitude to radians" do
      expect(location.phi).to eql Math::PI / 2
    end
  end

  describe "#lambda" do
    let(:location) { described_class.new(0, 45) }

    it "converts the longtitude to radians" do
      expect(location.lambda).to eql Math::PI / 4
    end
  end

  describe "#distance_to" do
    let(:location1) { described_class.new(53.339428, -6.257664) }
    let(:location2) { described_class.new(53.339428, -6.357664) }

    it "raises an error when the argument is not a Location instance" do
      expect { location1.distance_to(100) }.to raise_error ArgumentError
    end

    it "calculate distance in kilometers to to the given location" do
      expect(location1.distance_to(location2).round(2)).to eql 6.64
    end
  end
end
