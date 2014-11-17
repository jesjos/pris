module Pris
  module Vimla
    class Prices < PriceSource

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
        Country.new do |c|
          c.add_basic_data(country)
          c.add_rates(zones)
        end
      end

      class Country
        RATE_TYPES = ["to", "from", "within", "receive"]

        attr_reader :rates

        def initialize
          yield(self) if block_given?
        end

        def add_basic_data(country_data)
          @name = country_data.fetch("name")
          @zones = country_data.fetch("zones")
        end

        def add_rates(all_zones)
          @rates = Rates.new
          RATE_TYPES.each do |rate_type|
            zone = @zones[rate_type]
            zone_rates = all_zones[zone][rate_type]
            @rates[rate_type.to_sym] = zone_rates
          end
        end

      end

    end
  end
end
