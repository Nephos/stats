module Math::Mean
  # Standard arithmetic mean
  def mean : Float64
    return 0.0_f64 if empty?
    sum.to_f64 / size.to_f64
  end
end
