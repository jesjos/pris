require 'spec_helper'

module Pris
  module Hallon
    describe UrlFetcher do
      let(:subject) { UrlFetcher.new }

      describe "#urls" do
        it "returns a hash with all countries as keys" do
          urls = subject.urls
          countries = urls.keys
          expect(countries.length).to eq(228)
        end
      end

    end
  end
end