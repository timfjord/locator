# frozen_string_literal: true

require 'spec_helper'

describe Locator::Refinements::ToRadians do
  using described_class

  it "converts integers to radians" do
    expect(90.to_radians).to eql Math::PI / 2
  end

  it "converts floats to radians" do
    expect(90.0.to_radians).to eql Math::PI / 2
  end
end
