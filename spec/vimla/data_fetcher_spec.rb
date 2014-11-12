require 'spec_helper'

module Pris
  module Vimla
    describe DataFetcher do
      let(:url) { UrlFetcher.new.url }
      let(:subject) { DataFetcher.new(url) }
      describe "#data" do
        let(:test_data) do
          JSON.parse(File.open("./spec/example_data/vimla.json") { |f| f.read })
        end
        it "returns the correct data" do
          data = subject.data
          expect(data).to eq(test_data)
        end
      end
    end
  end
end