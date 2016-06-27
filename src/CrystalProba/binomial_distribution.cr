module Math
  class DomainError < Exception; end
  class SuperiorityError < Exception; end

  alias NumericValue = Float32 | Float64 | Int32 | Int64

  def self.factorial(n : Int32 | Int64)
    raise Math::DomainError.new "The argument must be a natural (out of domain -- factorial)" if n < 0
    return 1 if n == 0
    return (1..n).to_a.reduce{|a, b| a * b} #(:*)
  end

  def self.coef_binomial(n : Int32 | Int64, k : Int32 | Int64)
    return 0 if n < 0 || k < 0 || n < k
    return factorial(n) / factorial(k) * factorial(n - k)
  end

  # @note if no named parameters are used, then it will try to use the unamed parameters (tries, success, probability)
  def self.binomial_distribution(tries : Int32 | Int64, success : Int32 | Int64, probability : NumericValue)
    BinomialDistribution.new(n: tries, p: probability).distribute(success)
  end

end

class BinomialDistribution

  alias NumericValue = Float32 | Float64 | Int32 | Int64

  @n : Int32 | Int64
  @p : Float64

  # @param n [Fixnum] number of tries
  # @param p [Float] probability of success
  # @note if no probability is defined, the default value will be 0.5
  def initialize(@n, p : NumericValue = 0.5)
    @p = p.to_f64
    raise Math::DomainError.new "The argument `p` `#{@p}` is not in greater or equal to 0" if @p < 0.0
    raise Math::DomainError.new "The argument `p` `#{@p}` is not in lesser or equal to 1" if @p > 1.0
    raise Math::DomainError.new "The argument `n` `#{@n}` is not in greater or equal to 0" if @n < 0.0
  end

  def to_s
    "#<#{self.class} @n=#@n, @p=#@p>"
  end

  # @param k [Fixnum] number of test successful.
  # @return [Float] probability
  def distribute(k : Enumerable)
    k.map{|p| calc(p) }.inject(&:+)
  end

  # @param k [Enumerable] list of number of test successful.
  # @return [Float] probability
  def distribute(k : Int32 | Int64)
    raise Math::SuperiorityError.new "the number of success must be lesser or equal to the number of tries (#{@n})" if k > @n
    Math.coef_binomial(@n, k) * @p**k * (1 - @p) ** (@n - k)
  end

end
