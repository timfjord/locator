# frozen_string_literal: true

require 'spec_helper'

describe Locator::Customers do
  describe "#near" do
    let(:customers) { described_class.new('file.json') }
    let(:customer1) { Locator::Customer.new(name: 'Customer1', latitude: 53.339428, longitude: -6.257664) }
    let(:customer2) { Locator::Customer.new(name: 'Customer1', latitude: 53.339428, longitude: -6.357664) }
    let(:customer3) { Locator::Customer.new(name: 'Customer2', latitude: 53.339428, longitude: -8.357664) }
    let(:location) { Locator::Location.new(53.339428, -6.257664) }

    before do
      allow(customers).to receive(:build).and_return [customer1, customer2, customer3]
    end

    it "filters customers by the given location" do
      nearby = customers.near(location)

      expect(nearby.size).to eql 2
      expect(nearby).to include customer1
      expect(nearby).to include customer2
    end

    it "allows to specify the radius in km" do
      nearby = customers.near(location, radius: 5)

      expect(nearby.size).to eql 1
      expect(nearby).to include customer1
    end
  end
end
