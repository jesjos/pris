module Pris
  module Vimla
    describe UrlFetcher do
      let(:fetcher) { UrlFetcher.new }

      describe "#url" do
        it "returns the correct url" do
          expect(fetcher.url).to eq('https://vimla.se/upload/om-mobilabonnemanget/utomlands/utomlands_upd_1juli.json')
        end
      end
    end
  end
end