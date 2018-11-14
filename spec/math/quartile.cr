module Math::Quartile
  it "trivial" do
    arr = [1, 3, 5]

    arr.first_quartile.should eq 2.0
    arr.second_quartile.should eq 3.0
    arr.third_quartile.should eq 4.0

    arr.quartiles.should eq [2.0, 3.0, 4.0]

    arr.iqr.should eq 2.0
  end

  it "odd size input" do
    arr = [6, 7, 15, 36, 39, 40, 41, 42, 43, 47, 49]

    arr.first_quartile.should eq 25.5
    arr.second_quartile.should eq 40
    arr.third_quartile.should eq 42.5

    arr.quartiles.should eq [25.5, 40, 42.5]

    arr.iqr.should eq 17.0
  end

  it "even size input" do
    arr = [7, 15, 36, 39, 40, 41]

    arr.first_quartile.should eq 15.0
    arr.second_quartile.should eq 37.5
    arr.third_quartile.should eq 40.0

    arr.quartiles.should eq [15, 37.5, 40]

    arr.iqr.should eq 25.0
  end

  it "complex" do
    arr = [7, 7, 31, 31, 47, 75, 87, 115, 116, 119, 119, 155, 177]

    arr.first_quartile.should eq 31
    arr.second_quartile.should eq 87
    arr.third_quartile.should eq 119

    arr.quartiles.should eq [31, 87, 119]

    arr.iqr.should eq 88
  end

  it "complex 2" do
    # https://en.wikipedia.org/wiki/Quartile#Example_1
    arr = [6, 7, 15, 36, 39, 40, 41, 42, 43, 47, 49]

    arr.first_quartile.should eq 25.5
    arr.second_quartile.should eq 40
    arr.third_quartile.should eq 42.5

    arr.quartiles.should eq [25.5, 40, 42.5]

    arr.iqr.should eq 17
  end

  it "boxplot values" do
    arr = [-23, -5, 2, 5, 5, 6, 7, 8, 14, 15, 42, 1337]

    arr.first_quartile.should eq 3.5
    arr.second_quartile.should eq 6.5
    arr.third_quartile.should eq 14.5

    arr.quartiles.should eq [3.5, 6.5, 14.5]

    arr.iqr.should eq 11.0

    arr.lower_fence.should eq -13.0
    arr.upper_fence.should eq 31

    arr.lower_outliers.should eq [-23]
    arr.upper_outliers.should eq [42, 1337]

    arr.upper_fence(3).should eq 47.5
    arr.upper_outliers(3).should eq [1337]

  end
end
