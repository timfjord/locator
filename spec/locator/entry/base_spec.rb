# frozen_string_literal: true

require 'spec_helper'

describe Locator::Entry::Base do
  let(:klass) do
    Class.new(described_class) do
      attr_accessor :attr1, :attr2
    end
  end

  describe "initialization" do
    it "assigns attributes on init" do
      entry = klass.new(attr1: 1, attr2: 2)

      expect(entry.attr1).to eql 1
      expect(entry.attr2).to eql 2
    end

    it "ignores non exitings attributes" do
      expect { klass.new(attr3: 3) }.not_to raise_error
    end
  end

  describe "#assign_attributes" do
    let(:entry) { klass.new }

    it "assigns attributes" do
      entry.assign_attributes(attr1: 1, attr2: 2)

      expect(entry.attr1).to eql 1
      expect(entry.attr2).to eql 2
    end

    it "ignores non exitings attributes" do
      expect { entry.assign_attributes(attr3: 3) }.not_to raise_error
    end
  end
end
