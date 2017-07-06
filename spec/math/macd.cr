describe Math::MACD do
  it "test basic macd" do
    [1, 2, 3, 2, 1].macd(3).map { |e| e.round(3) }.should eq [2, 2.333, 2]
  end
end
