module NormaleDistribution
  class Persistant

    getter standard_deviation, esperance
    setter standard_deviation, esperance

    @standard_deviation : Number::All
    @esperance          : Number::All

    def initialize(@standard_deviation = 1.0, @esperance = 0.0)
      raise ArgumentError.new "standard_deviation must be > 0" unless @standard_deviation > 0.0
    end

    def greater_than(min : Number::All)
      1.0 - repartition(min)
    end

    def less_than(max : Number::All)
      repartition max
    end

    def between(min : Number::All, max : Number::All)
      repartition(max) - repartition(min)
    end

    private def density(t : Number::All)
      #1.0 / (standard_deviation * (2 * Math::PI) ** 0.5) * Math::exp((t - esperance) / (2 * standard_deviation)))
    end

    private def repartition(t : Number::All)
      erf = (t - esperance) / (standard_deviation * 2.0**0.5)
      0.5 * (1.0 + Math.erf(erf))
    end

  end
end
