module Pris
  module Hallon
    class DataFetcher
      def initialize(urls)
        @urls = urls
      end

      def data
        get_data(@urls)
      end

      def get_data(urls)
        urls.each_with_object({}) do |(country_name, url), output|
          output[country_name] = get_country_data(url)
        end
      end

      def get_country_data(url)
        parse_page(get_page(url))
      end

      def get_page(url)
        agent.get(url)
      end

      def parse_page(page)
        PageParser.new(page).rates
      end

      def agent
        @agent ||= Mechanize.new
      end
      
    end
  end
end