module Pris
  class Rates < Hash
    [:from, :to, :within, :receive].each do |direction|
      define_method(direction) do |type = nil|
        rates = self[direction]
        if type
          rates[type.to_s]
        else
          rates
        end
      end
    end
  end
end