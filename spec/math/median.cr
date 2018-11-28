describe Math::Median do
  it "test trivia" do
    arr = ([] of Int32)
    arr.median.should eq 0.0
  end

  it "test basic" do
    [1.0, 2.0].median.should eq 1.5
    [42, 1337].median.should eq 689.5

    [1, 2, 5].median.should eq 2.0
    [2, 5, 1].median.should eq 2.0

    [4, 1, 1, 1, 2].median.should eq 1.0
  end
end
