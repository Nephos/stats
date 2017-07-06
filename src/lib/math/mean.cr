module Math::Mean
  # Standard arithmetic mean
  # TODO: Handle big Float/Int
  def mean : Float64
    return 0.0_f64 if empty?
    sum.to_f64 / size.to_f64
  end

  # The square root of mean square
  def root_mean_square : Float64
    Math.sqrt map { |e| e ** 2 }.mean
  end
end

module Enumerable(T)
  include Math::Mean
end
