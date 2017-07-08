require "./mean"

module Math::StandardDeviation
  # Squared deviation from the mean.
  def variance
    return 0.0_f64 if empty?
    mean = mean()
    self.map { |e| (e - mean)**2 }.mean
  end

  # Population standard deviation.
  def standard_deviation
    Math.sqrt variance
  end
end

module Enumerable(T)
  include Math::StandardDeviation
end
