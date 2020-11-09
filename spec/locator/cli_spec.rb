# frozen_string_literal: true

require 'spec_helper'

describe Locator::CLI do
  let(:cli) { described_class.new('spec/fixtures/customers.txt') }

  it "raises an error when there is no json file specified" do
    expect { described_class.new }.to raise_error ArgumentError
  end

  describe "#run" do
    it "reads the passed file and output results to stdout" do
      expect { cli.run }.to output(<<~RESULTS).to_stdout
        Ian Kehoe (user_id: 4)
        Nora Dempsey (user_id: 5)
        Theresa Enright (user_id: 6)
        Eoin Ahearn (user_id: 8)
        Richard Finnegan (user_id: 11)
        Christina McArdle (user_id: 12)
        Olive Ahearn (user_id: 13)
        Michael Ahearn (user_id: 15)
        Patricia Cahill (user_id: 17)
        Eoin Gallagher (user_id: 23)
        Rose Enright (user_id: 24)
        Stephen McArdle (user_id: 26)
        Oliver Ahearn (user_id: 29)
        Nick Enright (user_id: 30)
        Alan Behan (user_id: 31)
        Lisa Ahearn (user_id: 39)
      RESULTS
    end
  end
end
