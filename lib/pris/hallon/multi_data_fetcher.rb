module Pris
  module Hallon
    class MultiDataFetcher
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
        DataFetcher.new(url, agent: agent).data
      end

      def agent
        @agent ||= Mechanize.new
      end
    end
  end
end