describe Math::Mean do
  it "test mean on Array(Float64)" do
    ([] of Float64).mean.should eq 0.0
    [1.0, 2.0, 3.0].mean.should eq 2.0
    [1.0, 2.0, -3.0].mean.should eq 0.0
  end

  it "test mean on Array(Int32)" do
    ([] of Int32).mean.should eq 0.0
    [1, 2, 3].mean.should eq 2.0
    [1, 2, -3].mean.should eq 0.0
  end
end
