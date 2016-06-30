module Math

  def self.factorial(n : Int::All)
    raise Math::DomainError.new "The argument must be a natural (out of domain -- factorial)" if n < 0
    return 1 if n == 0
    return (1..n).to_a.reduce{|a, b| a * b} #(:*)
  end

end
