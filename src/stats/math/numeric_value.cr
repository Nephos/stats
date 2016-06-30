abstract struct Int
  alias All = Int::Primitive #| BigInt
end

abstract struct Float
  alias All = Float::Primitive #| BigFloat | BigRational
end

abstract struct Number
  alias All = Int::All | Float::All
end
