module Math::Frequency(T)
  def frequency_of(value : T) : Float64
    return 0.0f64 if empty?
    count { |curr| curr == value }.to_f64 / size.to_f64
  end

  def all_frequencies : Hash(T, Float64)
    values = to_set
    frequencies = Hash(T, Float64).new(0.0f64, values.size)
    each { |value| frequencies[value] += 1  }
    frequencies.each { |k, _| frequencies[k] = frequencies[k] / size }
    frequencies
  end
end

module Enumerable(T)
  include Math::Frequency(T)
end
