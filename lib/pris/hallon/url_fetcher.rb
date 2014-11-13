module Pris
  module Hallon
    class UrlFetcher

      DEFAULT_ROOT_URL = "https://www.hallon.se/utlandspriser"
      DEFAULT_HOST = "www.hallon.se"

      def initialize(root_url = nil)
        @root_url = root_url
      end

      def urls
        @urls ||= process_page(get_page)
      end

      private

      def root_url
        @root_url || DEFAULT_ROOT_URL
      end

      def agent
        @agent ||= Mechanize.new
      end

      def get_page
        agent.get(root_url)
      end

      def process_page(page)
        elements = get_elements(page)
        elements.each_with_object({}) do |element, countries|
          country_data = process_element(element)
          countries[country_data.name] = country_data.url if country_data
        end
      end

      CountryData = Struct.new(:name, :url)

      def process_element(element)
        if path_attribute = element.attribute("value")
          path = element.attribute("value").value
          url = construct_url(path)
          country_name = element.content
          CountryData.new(country_name, url)
        end
      end

      def get_elements(page)
        page.search("select#select-country option")
      end


      def construct_url(path)
        URI::HTTPS.build(host: host, path: path).to_s
      end

      def host
        DEFAULT_HOST
      end

    end
  end
end