module Math::MACD
  # Computes the MACD (sliding mean) over N values.
  # It will return another list of *size - n + 1* elements, because it is not
  # possible to computes the n/2 first and lasts means.
  # NOTE for now it is impossible to computes a MACD with a pair window (n should be odd)
  #
  # TODO: maybe computing a reduced MACD is good solution against reduced returns ?
  def macd(n : Int)
    ((n.odd?) ? macd_odd(n) : macd_pair(n)).compact
  end

  # :nodoc:
  #
  # MACD computation if n is odd
  private def macd_odd(n)
    map_with_index do |_, i|
      next if i < n // 2
      next if i + n // 2 >= size
      range = (i - n // 2)..(i + n // 2)
      self[range].mean
    end
  end

  # :nodoc:
  #
  # MACD computation if n is pair
  private def macd_pair(n)
    raise ArgumentError.new "The MACD should be computed for an odd window (you should retry with #{n + 1})"
  end
end

module Enumerable(T)
  include Math::MACD
end
