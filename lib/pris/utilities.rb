require "forwardable"
require "pris/utilities/hash_utilities"

module Pris
  module Utilities
    class << self
      extend Forwardable
      def_delegators :hash_utilities, :symbolize_keys

      def hash_utilities
        HashUtilities.new
      end
    end
  end
end