module Math

  def self.coef_binomial(n : Int::All, k : Int::All)
    return 0 if n < 0 || k < 0 || n < k
    return factorial(n) / (factorial(k) * factorial(n - k))
  end

  # @note if no named parameters are used, then it will try to use the unamed parameters (tries, success, probability)
  def self.binomial_distribution(tries : Int::All, success : Int::All, probability : Number::All)
    BinomialDistribution.new(n: tries, p: probability).distribute(success)
  end

end
