require 'spec_helper'

module Pris
  module Halebop
    describe CountryCodes do
      let(:price_data) { CSV.read("./spec/example_data/halebop_country_map.csv", headers: :first_row) }
      let(:subject) { CountryCodes.new(price_data) }
      describe "#code_for" do
        it "returns the correct code" do
          price_data.each do |row|
            country_name = row['swedishCountryNames']
            name = subject.code_for(country_name)
            expected_code = "country#{row["countrycode"]}"
            expect(name).to eq(expected_code), "wrong for #{name.inspect}"
          end
        end
      end
      describe "#country_for" do
        it "returns the country name for the given code" do
          price_data.each do |row|
            country_name = row['swedishCountryNames']
            country_code = "country#{row["countrycode"]}"
            name = subject.country_for(country_code)
            expect(name).to eq(country_name)
          end
        end
      end
    end
  end
end
