module Math::Mean
  # Standard arithmetic mean
  # TODO: Handle big Float/Int
  def mean
    return 0.0_f64 if empty?
    sum.to_f64 / size.to_f64
  end

  # The root square mean of the list.
  # TODO: Handle big Float/Int
  def quadratic_mean
    return 0.0_f64 if empty?
    Math.sqrt map { |e| e ** 2 }.mean
  end

  # The geometric mean of the list.
  # For [a, b], a/c = c/b; c**2 = a*b
  # TODO: Handle big Float/Int
  def geometric_mean
    return 0.0_f64 if empty?
    reduce { |l, r| l * r } ** (1.0 / size.to_f64)
  end

  # The harmonic mean of the list.
  # TODO: Handle big Float/Int
  def harmonic_mean
    return 0.0_f64 if empty?
    size.to_f64 / map { |e| 1.0 / e }.sum
  end
end

module Enumerable(T)
  include Math::Mean
end
