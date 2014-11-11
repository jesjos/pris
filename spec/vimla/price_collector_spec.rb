require "spec_helper"

module Pris
  module Vimla
    describe PriceCollector do
      let(:collector) { PriceCollector.new }
      describe "#countries" do
        it "returns all countries" do
          expect(collector.countries.length).to eq(207)
        end
      end
    end
  end
end