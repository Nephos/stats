require "./normale_distribution/persistant"

module NormaleDistribution
  def between(standard_deviation : Number::All, esperance : Number::All, min : Number::All, max : Number::All)
    NormaleDistribution::Persistant.new(standard_deviation: standard_deviation, esperance: esperance).between min, max
  end

  def greater_than(standard_deviation : Number::All, esperance : Number::All, min : Number::All)
    NormaleDistribution::Persistant.new(standard_deviation: standard_deviation, esperance: esperance).greater_than min
  end

  def less_than(standard_deviation : Number::All, esperance : Number::All, max : Number::All)
    NormaleDistribution::Persistant.new(standard_deviation: standard_deviation, esperance: esperance).less_than max
  end

  extend self
end
