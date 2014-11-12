require 'oj'

module Pris
  module Vimla
    class DataFetcher
      def initialize(url)
        @url = url
      end

      def data
        parse(get_data(@url))
      end

      def parse(data)
        Oj.load(data)
      end

      def get_data(url)
        clean(agent.get(@url).content)
      end

      def clean(data)
        data.gsub("\xEF\xBB\xBF".force_encoding("ASCII-8BIT"), '')
      end

      def agent
        Mechanize.new
      end
    end
  end
end