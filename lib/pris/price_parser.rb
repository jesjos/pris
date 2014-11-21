module Pris
  class PriceParser
    def parse(raw)
      parse_float(extract_number(raw))
    end

    def extract_number(raw)
      raw ||= ''
      raw[/\d+,\d+/] || ''
    end

    def parse_float(string)
      Float(string.gsub(',', '.'))
    rescue ArgumentError
      0
    end
  end
end