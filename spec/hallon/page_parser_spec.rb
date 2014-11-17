require "spec_helper"

module Pris
  module Hallon
    describe PageParser do
      let(:url) { "http://www.hallon.se/utlandspriser/finland" }
      let(:page) { Mechanize.new.get(url) }
      let(:subject) { PageParser.new(page) }

      describe "#rates" do
        let(:rates) { subject.rates }
        it "contains to rates" do
          expected = {
              sms: 0,
              mms: 3.5,
              phone: 0.39,
              mobile: 1.45
          }
          expect(rates[:to]).to eq(expected)
        end
        it "contains from rates" do
          expected = {
              sms: 0.66,
              mms: 2.22,
              phone: 2.11,
              mobile: 2.11
          }
          expect(rates[:from]).to eq(expected)
        end
        it "contains within rates" do
          expected = {
              sms: 0.66,
              mms: 2.22,
              phone: 2.11,
              mobile: 2.11,
              data: 2.22
          }
          expect(rates[:within]).to eq(expected)
        end
        it "contains receive rates" do
          expected = {
              sms: 0,
              mms: 0,
              mobile: 0.55
          }
          expect(rates[:receive]).to eq(expected)
        end
      end


    end
  end
end