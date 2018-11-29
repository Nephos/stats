require "big"

describe Math::MACD do
  it "test basic macd" do
    [1, 2, 3, 2, 1].macd(3).map { |e| e.round(3) }.should eq [2, 2.333, 2]
  end

  it "test big basic macd" do
    puts [BigInt.new(1), BigInt.new(2), BigInt.new(3), BigInt.new(2), 1].macd(3).map { |e| e.round(3) }.should eq [2, 2.333, 2]
  end
end
