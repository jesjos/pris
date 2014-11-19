module Pris
  class Rates < Hash
    [:from, :to, :within, :receive].each do |direction|
      define_method(direction) do |type = nil|
        rates = self[direction]
        if type
          rates[type]
        else
          rates
        end
      end
    end

    def self.from_hash(hash)
      output = self.new
      hash.each do |(k,v)|
        output[k] = v
      end
      output
    end
  end
end