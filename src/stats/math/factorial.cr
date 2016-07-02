module Math
  module Factorial(U)
    def factorial(n : U)
      raise Math::DomainError.new "The argument must be a natural (out of domain -- factorial)" if n < 0
      return U.new(1) if n == 0
      return (1..n).to_a.reduce(U.new(1)) { |a, b| a * b }
    end
  end
end
