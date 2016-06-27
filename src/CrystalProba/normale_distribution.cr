require "./normale_distribution/persistant"

module NormaleDistribution

  def self.between(standard_deviation : Float, esperance : Float, a : Float, b : Float)
    NormaleDistribution::Persistant.new(standard_deviation: standard_deviation, esperance: esperance).between a, b
  end

  def self.greater_than(standard_deviation : Float, esperance : Float, a : Float)
    NormaleDistribution::Persistant.new(standard_deviation: standard_deviation, esperance: esperance).greater_than a
  end

  def self.less_than(standard_deviation : Float, esperance : Float, a : Float, b : Float)
    NormaleDistribution::Persistant.new(standard_deviation: standard_deviation, esperance: esperance).less_than a
  end

end
