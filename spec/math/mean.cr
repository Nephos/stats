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

  it "test geometric mean" do
    [2, 32].geometric_mean.should eq(8)
    [10, 15].geometric_mean.round(2).should eq(12.25)
    [5, 3, 12].geometric_mean.round(2).should eq(5.65)
    [7, 9, 12].geometric_mean.round(2).should eq(9.11)
  end

  it "test harmonic mean" do
    [1, 4, 1, 2].harmonic_mean.round(3).should eq(1.455)
    [13, 23, 12, 44, 55].harmonic_mean.round(3).should eq(20.438)
  end
end
