require "spec_helper"

module Pris
  module Vimla
    describe PriceCollector do
      let(:collector) { PriceCollector.new }
      let(:example_data) { Oj.load File.open("./spec/example_data/vimla.json") { |f| f.read} }
      let(:example_countries) { example_data["countries"].keys }

      describe "#countries" do
        it "returns all countries" do
          expect(collector.countries.keys).to eq(example_countries)
        end

        it "returns the correct data schema" do
          country = collector.countries["Finland"]
          expected = {
            to: 2.5,
            from: 0.67,
            within: 0.67,
            receive: 0
          }
          expect(country.sms).to eq(expected)
        end
      end
    end
  end
end