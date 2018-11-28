module Math::Frequency(T)
  def frequency_of(value : T) : Float64
    return 0.0f64 if empty?
    count { |curr| curr == value }.to_f64 / size.to_f64
  end
end

module Enumerable(T)
  include Math::Frequency(T)
end
