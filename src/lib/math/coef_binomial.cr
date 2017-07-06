# :nodoc:
require "big_int"

require "./factorial"

module Math
  include Math::Factorial

  # Computes the binomial coefficient of (n, k)
  def coef_binomial(n : Int, k : Int)
    return 0 if n < 0 || k < 0 || n < k
    # puts "n=#{n},k=#{k},n-k=#{n - k}, factorial(#{n})=#{factorial(n)}, (factorial(#{n}) * factorial(#{n - k}))=#{(factorial(k) * factorial(n - k))}"
    return factorial(n) / (factorial(k) * factorial(n - k))
  end

  # Computes the Binomial distributions of *success* among *tries* given a *probability* of success.
  #
  # NOTE if no named parameters are used, then it will try to use the unamed parameters (tries, success, probability).
  def binomial_distribution(tries : Int, success : Int, probability : Number)
    Stats::BinomialDistribution(typeof(tries), typeof(probability)).new(n: tries, p: probability).distribute(success)
  end
end
