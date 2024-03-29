# frozen_string_literal: true

require 'spec_helper'

describe Locator::Repo::JsonLines do
  describe "#load" do
    let(:file_path) { nil }
    let(:repo) { described_class.new(Hash, file_path) }

    context "with an invalid json file" do
      let(:file_path) { 'spec/fixtures/customers_invalid.txt' }

      it "raises an error" do
        expect { repo.load }.to raise_error JSON::ParserError
      end
    end

    context "with a valid json file" do
      let(:file_path) { 'spec/fixtures/customers.txt' }

      it "reads the file" do
        data = repo.load

        expect(data).to be_kind_of Array
        expect(data.size).to eql 32
        expect(data[0]).to include 'name' => 'Christina McArdle'
        expect(data[31]).to include 'name' => 'David Behan'
      end
    end
  end
end
