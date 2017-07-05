require "./normale_distribution/persistant"

module Stats::NormaleDistribution
  extend self

  # Gives the probability of [ min; max ] for a normal distribution (*standard_deviation*)
  def between(standard_deviation : Number, esperance : Number, min : Number, max : Number)
    Stats::NormaleDistribution::Persistant.new(standard_deviation: standard_deviation, esperance: esperance).between min, max
  end

  # Gives the probability of [ min; +inf [ for a normal distribution (*standard_deviation*)
  def greater_than(standard_deviation : Number, esperance : Number, min : Number)
    Stats::NormaleDistribution::Persistant.new(standard_deviation: standard_deviation, esperance: esperance).greater_than min
  end

  # Gives the probability of ] -inf; max ] for a normal distribution (*standard_deviation*)
  def less_than(standard_deviation : Number, esperance : Number, max : Number)
    Stats::NormaleDistribution::Persistant.new(standard_deviation: standard_deviation, esperance: esperance).less_than max
  end
end
