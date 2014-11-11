module Pris
  module Vimla
    class UrlFetcher

      DEFAULT_ROOT_URL = "https://vimla.se/om-mobilabonnemanget"
      DEFAULT_HOST = "vimla.se"

      def initialize(root_url = nil)
        @root_url = root_url
      end
      
      def url
        process_page(agent.get(root_url))
      end

      def root_url
        @root_url || DEFAULT_ROOT_URL
      end

      def agent
        @agent ||= Mechanize.new
      end

      def process_page(page)
        element = get_element(page)
        path_attribute = get_attribute(element)
        path = parse_attribute(path_attribute)
        construct_url(path)
      end

      def get_element(page)
        page.at(".abroad")
      end

      def get_attribute(element)
        element.attribute("ng-init").value
      end

      def parse_attribute(url_attribute)
        url_attribute[regexp, 1]
      end

      def regexp
        /fileUrl = '([^']+)'.*/
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