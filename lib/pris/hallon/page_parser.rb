module Pris
  module Hallon
    class PageParser
      attr_reader :page

      def initialize(page)
        @page = page
      end

      def rates
        {}.tap do |rates|
          rates[:to] = to_rates
          rates[:from] = from_rates
          rates[:within] = within_rates
          rates[:receive] = receive_rates
        end
      end

      def to_rates
        extract_rates(to_rows)
      end

      def from_rates
        extract_rates(from_rows)
      end

      def within_rates
        extract_rates(within_rows)
      end

      def receive_rates
        extract_rates(receive_rows)
      end

      def from_rows
        rows_at(1)
      end

      def to_rows
        rows_at(0)
      end

      def within_rows
        rows_at(3)
      end

      def receive_rows
        rows_at(2)
      end

      def rows_at(number)
        table = page.search(".details")[number]
        table.search("tr")
      end

      def extract_rates(rows)
        {}.tap do |rates|
          rows.each do |row|
            rates.merge!(ValueExtractor.new(row).values)
          end
        end
      end
    end
  end
end