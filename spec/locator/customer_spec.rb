# frozen_string_literal: true

require 'spec_helper'

describe Locator::Customer do
  let(:customer) { described_class.new }

  describe "#location" do
    it "builds a Location instance" do
      customer.latitude = 53.339428
      customer.longitude = -6.257664

      expect(customer.location).to be_kind_of Locator::Location
      expect(customer.location.latitude).to eql customer.latitude
      expect(customer.location.longitude).to eql customer.longitude
    end
  end

  describe "#latitude=" do
    it "expires the location memoization" do
      expect(customer.location.latitude).to eql 0.0

      customer.latitude = 53.339428
      expect(customer.location.latitude).to eql 53.339428
    end
  end

  describe "#longitude=" do
    it "expires the location memoization" do
      expect(customer.location.longitude).to eql 0.0

      customer.longitude = -6.257664
      expect(customer.location.longitude).to eql(-6.257664)
    end
  end
end
