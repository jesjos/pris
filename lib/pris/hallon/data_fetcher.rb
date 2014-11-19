module Pris
  module Hallon
    class DataFetcher
      attr_reader :agent
      def initialize(url, agent: Mechanize.new)
        @url = url
        @agent = agent
      end

      def data
        get_country_data(@url)
      end

      private

      def get_country_data(url)
        parse_page(get_page(url))
      end

      def get_page(url)
        agent.get(url)
      end

      def parse_page(page)
        PageParser.new(page).rates
      end
    end
  end
end