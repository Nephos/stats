module Math::Mean
  # Standard arithmetic mean
  # TODO: Handle big Float/Int
  def mean : Float64
    return 0.0_f64 if empty?
    sum.to_f64 / size.to_f64
  end

  # The square root of mean square
  def quadratic_mean : Float64
    Math.sqrt map { |e| e ** 2 }.mean
  end

  # For [a, b], a/c = c/b; c**2 = a*b
  def geometric_mean : Float64
    reduce { |l, r| l * r } ** (1.0 / size.to_f64)
  end

  def harmonic_mean : Float64
    size.to_f64 / map { |e| 1.0 / e }.sum
  end
end

module Enumerable(T)
  include Math::Mean
end
