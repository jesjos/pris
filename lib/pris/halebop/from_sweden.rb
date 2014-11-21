module Pris
  module Halebop
    class FromSweden
      attr_reader :price_parser

      def initialize(price_data, country_codes)
        @price_data = price_data
        @country_codes = country_codes
        @price_parser = PriceParser.new
      end

      def to(country_name)
        price_map[country_name]
      end

      private

      attr_reader :country_codes

      def price_map
        @price_map ||= construct_price_map(@price_data)
      end

      def construct_price_map(data)
        data.each_with_object({}) do |country_data, price_map|
          name, prices = process_country(country_data)
          price_map[name] = prices
        end
      end

      def process_country(country_data)
        prices = {
            phone: price_parser.parse(country_data['callToLandline']),
            mobile: price_parser.parse(country_data['callToCellphone']),
            sms: 0,
            mms: 0
        }
        country_code = country_data['country']
        name = resolve_name(country_code)
        [name, prices]
      end

      def resolve_name(country_code)
        country_codes.country_for(country_code)
      end
    end
  end
end