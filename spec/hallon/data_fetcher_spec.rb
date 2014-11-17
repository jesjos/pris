require 'spec_helper'

module Pris
  module Hallon
    describe DataFetcher do
      let(:urls) do
        {
            "Finland" => "http://www.hallon.se/utlandspriser/finland",
            "Afghanistan" => "http://www.hallon.se/utlandspriser/afghanistan"
        }
      end
      let(:subject) { DataFetcher.new(urls) }
      let(:countries) { subject.data.keys }
      describe "#data" do
        it "returns data for all the given urls" do
          expect(countries.length).to eq(2)
          expect(countries).to eq(["Finland", "Afghanistan"])
        end
      end
    end
  end
end