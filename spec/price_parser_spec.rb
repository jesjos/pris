require 'spec_helper'

module Pris
  describe PriceParser do

    let(:test_data) do
      [
          "2,11 kr/minut",
          "2,11 kr/SMS",
          "2,11 kr/MMS *",
          "2,11 kr/MB"
      ]
    end

    let(:subject) { PriceParser.new }

    it "handles different kinds of inputs" do
      test_data.each do |sample|
        expect(subject.parse(sample)).to eq(2.11)
      end
    end
  end
end
