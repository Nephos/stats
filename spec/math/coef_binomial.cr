describe Math do
  it "coef binomial basics" do
    Math.coef_binomial(1, 1).should eq 1
    Math.coef_binomial(12, 6).should eq 924
    Math.coef_binomial(5, 2).should eq 10
  end

  it "coef binomial tests a < b" do
    Math.coef_binomial(0, 1).should eq 0
    Math.coef_binomial(1, 2).should eq 0
    Math.coef_binomial(1, 2).should eq 0
    Math.coef_binomial(261, 262).should eq 0
    Math.coef_binomial(261, 263).should eq 0
    Math.coef_binomial(261, 26372).should eq 0
    20.times {|i| Math.coef_binomial(i + 1, i + rand(1..5) + 1).should eq 0}
  end

  it "coef binomial tests a = b" do
    20.times {|i| Math.coef_binomial(i + 1, i + 1).should eq 1}
  end

end
