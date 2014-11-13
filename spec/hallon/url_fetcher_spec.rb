require 'spec_helper'

module Pris
  module Hallon
    describe UrlFetcher do
      let(:subject) { UrlFetcher.new }

      describe "#urls" do
        it "returns a hash with all countries as keys" do
          urls = subject.urls
          countries = urls.keys
          expect(countries.length).to eq(227)
        end

        let(:finland_url) { "https://www.hallon.se/utlandspriser/finland"}
        let(:afghanistan_url) { "https://www.hallon.se/utlandspriser/afghanistan"}

        it "returns the correct data for some examples" do
          urls = subject.urls
          finland = urls["Finland"]
          expect(finland).to eq(finland_url)
          
          afghanistan = urls["Afghanistan"]
          expect(afghanistan).to eq(afghanistan_url)
        end
      end

    end
  end
end