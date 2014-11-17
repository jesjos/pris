module Pris
  module Hallon
    class Prices < PriceSource
      def countries
        @countries ||= construct_countries(raw_data)
      end

      def raw_data
        @raw_data ||= begin
          urls = UrlFetcher.new.urls
          DataFetcher.new(urls).data
        end
      end

      def construct_countries(raw_data)
        raw_data.each_with_object({}) do |(country, rates), all_rates|
          rates = Rates.new(rates)
          all_rates[country] = Country.new(rates)
        end
      end

      Country = Struct.new(:rates)
    end
  end
end