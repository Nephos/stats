module Math::MACD
  def macd(n : Int)
    ((n.odd?) ? macd_odd(n) : macd_pair(n)).compact
  end

  private def macd_odd(n)
    map_with_index do |_, i|
      next if i < n / 2
      next if i + n / 2 >= size
      range = (i - n / 2)..(i + n / 2)
      self[range].mean
    end
  end

  private def macd_pair(n)
    raise ArgumentError.new "The MACD should be computed for an odd window"
  end
end

module Enumerable(T)
  include Math::MACD
end
