# This file defines new operations on big numbers with native data types

# :nodoc:
require "big_int"
# :nodoc:
require "big_float"

{% for klass in [Float32, Float64, Int8, Int16, Int32, Int64, UInt8, UInt16, UInt32, UInt64] %}
  # :nodoc:
  struct {{klass}}
    {% for op in ["+", "-", "*", "%", "/"] %}
      {% for other_klass in [BigFloat, BigInt] %}
        # :nodoc:
        def {{op.id}}(other : {{other_klass}})
          {{other_klass}}.new(self) {{op.id}} other
        end
      {% end %}
    {% end %}

      # :nodoc:
    def unsafe_div(other : BigInt)
      BigInt.new(self) / other
    end

    # :nodoc:
    def unsafe_mod(other : BigInt)
      BigInt.new(self) % other
    end

  end
{% end %}

# :nodoc:
struct BigInt
  {% for op in ["+", "-", "*", "%", "/"] %}
  def {{op.id}}(other : Float::Primitive)
    self {{op.id}} BigFloat.new(other)
  end
  {% end %}

  def /(other : BigFloat)
    self / other
  end

  def unsafe_shr(other : Int::All)
    BigInt.new(self) ** other
  end
end
