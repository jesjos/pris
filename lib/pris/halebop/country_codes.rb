module Pris
  module Halebop
    class CountryCodes
      def initialize(country_data)
        @name_map = {}
        @code_map = {}
        build_data(country_data)
      end

      def code_for(country)
        name_map[country]
      end

      def country_for(code)
        code_map[code]
      end

      private

      attr_reader :name_map, :code_map

      def build_data(data)
        data.each do |country_data|
          original_name = country_data['swedishCountryNames']
          country_code = country_code(country_data["countrycode"])
          name_map[original_name] = country_code
          code_map[country_code] = original_name
        end
      end

      def country_code(code)
        "country#{code}"
      end
    end
  end
end