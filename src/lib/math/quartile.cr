# There are several methods for computing the quartiles of an array.
#
# This library utilizes the method proposed by John Tukey
# https://en.wikipedia.org/wiki/Quartile#Method_2
#
module Math::Quartile
  def lower_quartile
    return 0 if empty?
    m = self.median
    lower_half = self.select { |i| i <= m }
    lower_half.median
  end

  # alias
  def first_quartile
    lower_quartile
  end

  # alias
  def second_quartile
    median
  end

  def upper_quartile
    return 0 if empty?
    m = self.median
    upper_half = self.select { |i| i >= m }
    upper_half.median
  end

  # alias
  def third_quartile
    upper_quartile
  end

  def quartiles
    [first_quartile, second_quartile, third_quartile]
  end

  def iqr
    third_quartile - first_quartile
  end

  # alias
  def interquartile_range
    iqr
  end

  def lower_fence(k : Number = 1.5)
    lower_quartile - k * iqr
  end

  def upper_fence(k : Number = 1.5)
    upper_quartile + k * iqr
  end

  def lower_outliers(k : Number = 1.5)
    lf = lower_fence k
    self.select { |i| i < lf }
  end

  def upper_outliers(k : Number = 1.5) : Array
    uf = upper_fence k
    self.select { |i| i > uf }
  end
end

module Enumerable(T)
  include Math::Quartile
end
