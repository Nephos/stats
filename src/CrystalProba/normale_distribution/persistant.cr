module NormaleDistribution
  class Persistant

    getter standard_deviation, esperance
    setter standard_deviation, esperance

    alias NumericValue = Float32 | Float64 | Int32 | Int64

    @standard_deviation : Float64
    @esperance          : Float64

    def initialize(standard_deviation : NumericValue = 1.0, esperance : NumericValue = 0.0)
      @standard_deviation = standard_deviation.to_f64
      @esperance = esperance.to_f64
      raise ArgumentError.new "standard_deviation must be > 0" unless @standard_deviation > 0.0
    end

    def greater_than(a : NumericValue)
      1.0 - repartition(a)
    end

    def less_than(a : NumericValue)
      repartition a
    end

    def between(a : NumericValue, b : NumericValue)
      repartition(b) - repartition(a)
    end

    private def density(t : NumericValue)
      #1.0 / (standard_deviation * (2 * Math::PI) ** 0.5) * Math::exp((t - esperance) / (2 * standard_deviation)))
    end

    private def repartition(t : NumericValue)
      erf = (t - esperance) / (standard_deviation * 2.0**0.5)
      0.5 * (1.0 + Math.erf(erf))
    end

  end
end
