require "./factorial"
require "big_int"

module Math
  {% for num_type in [Int8, Int16, Int32, Int64, UInt8, UInt16, UInt32, UInt64, BigInt] %}
    include Math::Factorial({{num_type}})
  {% end %}

  extend self

  def coef_binomial(n : Int::All, k : Int::All)
    return 0 if n < 0 || k < 0 || n < k
    # puts "n=#{n},k=#{k},n-k=#{n - k}, factorial(#{n})=#{factorial(n)}, (factorial(#{n}) * factorial(#{n - k}))=#{(factorial(k) * factorial(n - k))}"
    return factorial(n) / (factorial(k) * factorial(n - k))
  end

  # @note if no named parameters are used, then it will try to use the unamed parameters (tries, success, probability)
  def binomial_distribution(tries : Int::All, success : Int::All, probability : Number::All)
    BinomialDistribution.new(n: tries, p: probability).distribute(success)
  end
end
