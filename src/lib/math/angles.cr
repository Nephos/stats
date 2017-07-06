module Math::Angle
  # Convert degree to radian
  def radian
    (Math::PI * self) / 180
  end

  def degree
    (self * 180) / (Math::PI)
  end
end

abstract struct Number
  include Math::Angle
end
