module Pris
  module Utilities
    class HashUtilities
      # Copied from ActiveSupport
      def symbolize_keys(hash)
        transform_keys(hash) { |key| key.to_sym rescue key }
      end

      # Copied from ActiveSupport
      def transform_keys(hash)
        result = {}
        hash.each_key do |key|
          result[yield(key)] = hash[key]
        end
        result
      end
    end
  end
end