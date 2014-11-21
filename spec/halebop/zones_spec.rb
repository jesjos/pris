require 'spec_helper'
require 'csv'

module Pris
  module Halebop
    describe Zones do
      let(:country_map) { CSV.read("./spec/example_data/halebop_country_map.csv", headers: :first_row) }
      let(:subject) { Zones.new(country_map) }
      describe "#[]" do
        it "returns the zone of the given country" do
          expect(subject["Finland"]).to eq("zone_1_eu")
        end
      end
    end
  end

end