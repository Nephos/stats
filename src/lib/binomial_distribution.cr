class Stats::BinomialDistribution(N, P)
  getter n : N
  getter p : P

  # @param n [Fixnum] number of tries
  # @param p [Float] probability of success
  #
  # NOTE if no probability is defined, the default value will be 0.5
  def initialize(@n : N, @p : P = 0.5)
    raise Math::DomainError.new "The argument `p` `#{@p}` is not in greater or equal to 0" if @p < 0.0
    raise Math::DomainError.new "The argument `p` `#{@p}` is not in lesser or equal to 1" if @p > 1.0
    raise Math::DomainError.new "The argument `n` `#{@n}` is not in greater or equal to 0" if @n < 0.0
  end

  def to_s
    "#<#{self.class} @n=#@n, @p=#@p>"
  end

  # @param k [Fixnum] number of test successful.
  #
  # TODO : Enumerable of Int
  def distribute(k : Enumerable)
    k.map { |p| distribute(p) }.reduce { |a, b| a + b }
  end

  # @param k [Enumerable] list of number of test successful.
  def distribute(k : Int)
    raise Math::SuperiorityError.new "the number of success must be lesser or equal to the number of tries (#{@n})" if k > @n
    Math.coef_binomial(@n, k) * (@p**k) * ((1 - @p) ** (@n - k))
  end
end
