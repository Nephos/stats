class Stats::NormaleDistribution::Persistant(D, E)
  property standard_deviation : D
  property esperance : E

  # Create a new normale distribution
  def initialize(@standard_deviation : D = 1.0, @esperance : E = 0.0)
    raise ArgumentError.new "standard_deviation must be > 0" unless @standard_deviation > 0.0
  end

  # Gives the probability of [ min; +inf [
  def greater_than(min : Number)
    1.0 - repartition(min)
  end

  # Gives the probability of ] -inf; max ]
  def less_than(max : Number)
    repartition max
  end

  # Gives the probability of [ min; max ]
  def between(min : Number, max : Number)
    repartition(max) - repartition(min)
  end

  # private def density(t : Number::All)
  #   1.0 / (standard_deviation * (2 * Math::PI) ** 0.5) * Math::exp((t - esperance) / (2 * standard_deviation))
  # end

  private def repartition(t : Number)
    erf = (t - esperance) / (standard_deviation * 2.0**0.5)
    0.5 * (1.0 + Math.erf(erf))
  end
end
