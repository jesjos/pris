module Pris
  module Vimla
    class PriceCollector

      def countries
        
      end

      def data
        @data ||= get_data
      end

      def get_data
        url = UrlFetcher.new.url
        DataFetcher.new(url).data
      end

    end
  end
end