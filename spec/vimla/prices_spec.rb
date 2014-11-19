require "spec_helper"

module Pris
  module Vimla
    describe Prices do
      let(:collector) { Prices.new }
      let(:example_data) { Oj.load File.open("./spec/example_data/vimla.json") { |f| f.read} }
      let(:example_countries) { example_data["countries"].keys }

      describe "#countries" do
        let(:country) { collector.countries["Finland"] }
        it "returns all countries" do
          expect(collector.countries.keys).to eq(example_countries)
        end

        it "returns the correct prices to Finland" do
          expected = {
            phone: 3.63,
            mobile: 3.63,
            sms: 2.5,
            mms: 4.5
          }
          expect(country.rates.to).to eq(expected)
        end

        it "returns the correct prices from Finland" do
          expected = {
            phone: 2.1,
            mobile: 3.6,
            sms: 0.67,
            mms: 2.2
          }
          expect(country.rates.from).to eq(expected)
        end

        it "returns the correct prices within Finland" do
          expected = {
            phone: 2.1,
            mobile: 3.6,
            sms: 0.67,
            mms: 2.2,
            data: 29
          }
          expect(country.rates.within).to eq(expected)
        end

        it "returns the correct prices for receiving in Finland" do
          expected = {
            mobile: 0.55,
            sms: 0,
            mms: 2.2
          }
          expect(country.rates.receive).to eq(expected)
        end
      end
    end
  end
end