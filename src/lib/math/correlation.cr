require "./std_dev"

module Math::Correlation
  # Computes the correlation coefficient with another list
  def correlation_coef(rhs : Enumerable)
    raise "Impossible to computes the covariance for #{rhs.size} list (require #{size})" if rhs.size != size
    e = self.standard_deviation * rhs.standard_deviation
    covariance(rhs) / e
  end

  # Computes the covariance with another list
  def covariance(rhs : Enumerable)
    raise "Impossible to computes the covariance for #{rhs.size} list (require #{size})" if rhs.size != size
    e = self.mean * rhs.mean
    self.zip(rhs).map do |t|
      x = t[0]
      y = t[1]
      x*y - e
    end.mean
  end
end

module Enumerable(T)
  include Math::Correlation
end
