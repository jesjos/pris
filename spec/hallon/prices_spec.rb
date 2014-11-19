require "spec_helper"

module Pris
  module Hallon
    describe Prices do
      let(:prices) { Prices.new }

      describe "#countries" do
        let(:country) { prices.countries["Finland"] }

        it "returns the correct prices to Finland" do
          expected = {
              phone: 0.39,
              mobile: 1.45,
              sms: 0,
              mms: 3.5
          }
          expect(country.rates.to).to eq(expected)
        end

        it "returns the correct prices from Finland" do
          expected = {
              phone: 2.11,
              mobile: 2.11,
              sms: 0.66,
              mms: 2.22
          }
          expect(country.rates.from).to eq(expected)
        end

        it "returns the correct prices within Finland" do
          expected = {
              phone: 2.11,
              mobile: 2.11,
              sms: 0.66,
              mms: 2.22,
              data: 2.22
          }
          expect(country.rates.within).to eq(expected)
        end

        it "returns the correct prices for receiving in Finland" do
          expected = {
              mobile: 0.55,
              sms: 0,
              mms: 0
          }
          expect(country.rates.receive).to eq(expected)
        end
      end
    end
  end
end