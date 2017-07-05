include Stats

describe Math do
  it "binomial_distribution" do
    0.0.step(by: 0.1, to: 1.0) do |proba|
      Math.binomial_distribution(tries: 1, probability: proba, success: 1).should eq(proba)
    end
    Math.binomial_distribution(tries: 10, probability: 0.2, success: 3).round(3).should eq(0.201)
    Math.binomial_distribution(tries: 10, probability: 0.2, success: 6).round(4).should eq(0.0055)
  end
end

describe BinomialDistribution do
  it "initialize" do
    BinomialDistribution(Int32, Float64).new(0).should be_a(BinomialDistribution(Int32, Float64))
    BinomialDistribution(Int32, Float64).new(1).should be_a(BinomialDistribution(Int32, Float64))
    BinomialDistribution(Int32, Float64).new(100).should be_a(BinomialDistribution(Int32, Float64))
    BinomialDistribution(Int32, Int32).new(1, 0).should be_a(BinomialDistribution(Int32, Int32))
    BinomialDistribution(Int32, Float64).new(1, 0.5).should be_a(BinomialDistribution(Int32, Float64))
    BinomialDistribution(Int32, Int32).new(1, 1).should be_a(BinomialDistribution(Int32, Int32))
  end

  it "initialize errors" do
    expect_raises { BinomialDistribution(Int32, Float64).new(-1) }
    expect_raises { BinomialDistribution(Int32, Int32).new(0, -1) }
    expect_raises { BinomialDistribution(Int32, Float64).new(0, 1.5) }
  end

  it "distribute" do
    b = BinomialDistribution(Int32, Float64).new(2, 0.5)
    b.should be_a(BinomialDistribution(Int32, Float64))
    b.distribute(0).should eq 0.25
    b.distribute(1).should eq 0.5
    b.distribute(2).should eq 0.25
    b.distribute([0, 2]).should eq 0.5
    b.distribute([0, 1]).should eq 0.75
    b.distribute([2, 1]).should eq 0.75
  end

  it "with spaces tests" do
  end

  it "with BitNumber" do
    BinomialDistribution(BigInt, BigFloat).new(BigInt.new(1), BigFloat.new(1)).should be_a(BinomialDistribution(BigInt, BigFloat))
    ((a = BinomialDistribution(BigInt, BigFloat).new(BigInt.new(10), BigFloat.new(0.02)).distribute(BigInt.new(1)..BigInt.new(10))) > 0.02).should be_true
    ((b = BinomialDistribution(BigInt, BigFloat).new(BigInt.new(20), BigFloat.new(0.02)).distribute(BigInt.new(1)..BigInt.new(20))) > 0.02).should be_true
    ((c = BinomialDistribution(BigInt, BigFloat).new(BigInt.new(50), BigFloat.new(0.02)).distribute(BigInt.new(1)..BigInt.new(50))) > 0.02).should be_true
    (b > a).should be_true
    (c > b).should be_true
    # p a, b, c
  end
end
