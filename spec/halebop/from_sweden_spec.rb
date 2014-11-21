require 'spec_helper'

module Pris
  module Halebop
    describe FromSweden do
      let(:price_data) { CSV.read("./spec/example_data/halebop_sweden_to_rest_price.csv", headers: :first_row) }
      let(:country_map_data) { CSV.read("./spec/example_data/halebop_country_map.csv", headers: :first_row) }
      let(:country_codes) { CountryCodes.new(country_map_data) }
      let(:from_sweden) { FromSweden.new(price_data, country_codes) }
      describe "#to" do
        it "returns prices for mobile, phone, sms and mms" do
          expected = {
              sms: 0,
              mms: 0,
              phone: 0.39,
              mobile: 0.99
          }
          expect(from_sweden.to("Finland")).to eq(expected)
        end
      end
    end
  end

end