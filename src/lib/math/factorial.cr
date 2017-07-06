module Math
  module Factorial
    # A factorial(N) = 1x2x3x...xN
    def factorial(n : Number)
      raise Math::DomainError.new "The argument must be a natural (out of domain -- factorial)" if n < 0
      return (typeof(n)).new(1) if n == 0
      return (1..n).to_a.reduce((typeof(n)).new(1)) { |a, b| a * b }
    end
  end
end
