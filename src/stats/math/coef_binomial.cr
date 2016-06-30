module Math

  def self.coef_binomial(n : Int32 | Int64, k : Int32 | Int64)
    return 0 if n < 0 || k < 0 || n < k
    return factorial(n) / (factorial(k) * factorial(n - k))
  end

  # @note if no named parameters are used, then it will try to use the unamed parameters (tries, success, probability)
  def self.binomial_distribution(tries : Int32 | Int64, success : Int32 | Int64, probability : NumericValue)
    BinomialDistribution.new(n: tries, p: probability).distribute(success)
  end

end
