module Pris
  class PriceSource
    def countries
      raise "Subclasses must override `#countries`"
    end
  end
end