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

  it "test quadratic mean" do
    [1, 2, 3, 2].root_mean_square.round(4).should eq(2.1213)
    [1, 2, 1, 5, 10, 9, 1, -13, 2].root_mean_square.round(4).should eq(6.549)
  end
end
