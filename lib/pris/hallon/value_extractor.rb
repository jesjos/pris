module Pris
  module Hallon
    class ValueExtractor

      attr_reader :row

      def initialize(row)
        @row = row
      end

      def value_map
        {
            "Samtal till fastnät" => [:phone],
            "Samtal till mobil" => [:mobile],
            "Samtal till fast/mobil" => [:phone, :mobile],
            "Samtal" => [:mobile],
            "SMS" => [:sms],
            "MMS" => [:mms],
            "Data" => [:data]
        }
      end

      def values
        types = determine_types(row)
        if types
          value = parse_value(types, row)
          {}.tap do |values|
            types.each do |type|
              values[type] = value
            end
          end
        else
          {}
        end
      end

      def determine_types(row)
        value_map[description(row)]
      end

      def description(row)
        row.css("td").first.content.strip
      end

      def parse_value(type, row)
        raw = raw_value(row)
        PriceParser.new.parse(raw)
      end

      def raw_value(row)
        row.css("td").last.content.strip
      end
    end
  end
end