describe Math::StandardDeviation do
  it "test variance & std dev explained" do
    arr = [1, 2, 3, 4, 4]
    mean = (4 + 4 + 3 + 2 + 1) / 5.0
    variance = ((4 - mean)**2 + (4 - mean)**2 + (3 - mean)**2 + (2 - mean)**2 + (1 - mean)**2) / 5.0
    standard_deviation = Math.sqrt(variance)
    arr.mean.should eq(mean)
    arr.variance.should eq(variance)
    arr.standard_deviation.should eq(standard_deviation)
  end

  it "test standard deviation without explanations" do
    arr = [1, 5, 23, 2, 0, 0, 1]
    arr.mean.round(2).should eq 4.57
    arr.variance.round(2).should eq 59.10
    arr.standard_deviation.round(2).should eq 7.69

    [1.0, 2.0, 3.0].variance.round(4).should eq(0.6667)
    [1.0, 2.0, 3.0].standard_deviation.round(4).should eq(0.8165)
  end

  it "test several special case" do
    arr = [] of Int32
    arr.variance.should eq 0.0
    arr.standard_deviation.should eq 0.0
  end
end
