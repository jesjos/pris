module Pris
  module Hallon
    class Prices < PriceSource
      def countries
        @countries ||= CountriesProxy.new(urls)
      end

      def urls
        @urls ||= UrlFetcher.new.urls
      end

      class CountriesProxy
        def initialize(urls)
          @urls = urls
          @countries = {}
        end

        def [](country)
          countries[countries] || get_country(country)
        end

        private

        attr_reader :countries

        Country = Struct.new(:rates)

        def get_country(country)
          if url = url_for(country)
            data = DataFetcher.new(url).data
            countries[country] = Country.new(Rates.from_hash(data))
          end
        end

        def url_for(country)
          @urls[country]
        end
      end
    end
  end
end