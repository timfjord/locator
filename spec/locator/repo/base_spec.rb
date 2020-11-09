# frozen_string_literal: true

require 'spec_helper'

describe Locator::Repo::Base do
  let(:klass) do
    Class.new(described_class) do
      def load
        (1..10).to_a
      end
    end
  end
  let(:entry_class) { Struct.new(:val) }
  let(:repo) { klass.new(entry_class) }

  it "behaves like an enumerator" do
    expect(repo).to respond_to(:each, :map)
  end

  it "allows to chain some methods" do
    sorted_filtered = repo
      .find_all { |e| e.val.odd? }
      .sort_by { |e| -e.val }

    expect(sorted_filtered.size).to eql 5
    [9, 7, 5, 3, 1].each_with_index do |val, index|
      expect(sorted_filtered[index].val).to eql val
    end
  end

  describe "#build" do
    it "loads data and passes each entry to the entry_class constructor" do
      result = repo.build

      expect(result.size).to eql 10
      (1..10).each do |val|
        expect(result[val - 1]).to be_kind_of entry_class
        expect(result[val - 1].val).to eql val
      end
    end
  end

  describe "#find_all/#select" do
    it "filters entries and returns a copy of the repo with adjusted scope" do
      filtered = repo.find_all { |e| e.val.odd? }

      expect(repo.size).to eql 10

      expect(filtered).to be_kind_of klass
      expect(filtered.size).to eql 5
      [1, 3, 5, 7, 9].each_with_index do |val, index|
        expect(filtered[index].val).to eql val
      end
    end
  end

  describe "#sort_by" do
    it "sorts by the given block and returns a copy of the repo" do
      sorted = repo.sort_by { |e| -e.val }

      expect(sorted.size).to eql 10
      expect(sorted[0].val).to eql 10
      expect(sorted.last.val).to eql 1
    end
  end

  describe "#reload" do
    let(:filtered) { repo.find_all { |e| e.val.odd? } }

    it "resets the scope" do
      expect(filtered.size).to eql 5

      filtered.reload

      expect(filtered.size).to eql 10
    end
  end
end
