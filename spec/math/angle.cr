describe Math::Angle do
  it "verify radian to degree" do
    45.radian.should eq(Math::PI / 4)
    90.radian.should eq(Math::PI / 2)
    180.radian.should eq(Math::PI)
    360.radian.should eq(Math::PI * 2)
  end

  it "verify degree to radian" do
    (Math::PI / 4).degree.should eq(45)
    (Math::PI / 2).degree.should eq(90)
    (Math::PI).degree.should eq(180)
    (Math::PI * 2).degree.should eq(360)
  end
end
