module Pris
  module Halebop
    class Zones
      def initialize(country_map)
        @country_map = country_map
      end

      def [](country)
        zones[country]
      end

      def zones
        @zones ||= build_zone_map
      end

      def build_zone_map

      end
    end
  end
end
