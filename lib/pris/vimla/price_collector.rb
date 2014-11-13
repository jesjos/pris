module Pris
  module Vimla
    class PriceCollector

      def countries
        @countries ||= collect_rates(raw_data)
      end

      def raw_data
        @raw_data ||= get_data
      end

      def get_data
        url = UrlFetcher.new.url
        DataFetcher.new(url).data
      end

      def collect_rates(raw_data)
        countries = raw_data["countries"]
        zones = raw_data["zones"]
        countries.each_with_object({}) do |(country, data), collection|
          collection[country] = build_country(data, zones)
        end
      end

      def build_country(country, zones)
        
      end

    end
  end
end
