describe Math do
  it "factorial" do
    Math.factorial(0).should eq 1
    Math.factorial(1).should eq 1
    Math.factorial(2).should eq 2
    Math.factorial(3).should eq 6
    Math.factorial(4).should eq 24
    Math.factorial(5).should eq 120
    Math.factorial(6).should eq 720
    Math.factorial(6).should eq 720
  end

  it "factorial bigint" do
    res = (1..20).to_a.reduce(BigInt.new 1) { |e, i| e * BigInt.new(i) }
    Math.factorial(BigInt.new 20).should eq res
  end
end
