describe BinomialDistribution do

  it "simple instances" do
    0.0.step(by: 0.1, limit: 1.0) do |proba|
      Math.binomial_distribution(tries: 1, probability: proba, success: 1).should eq(proba)
    end
    Math.binomial_distribution(tries: 10, probability: 0.2, success: 3).round(3).should eq(0.201)
    Math.binomial_distribution(tries: 10, probability: 0.2, success: 6).round(4).should eq(0.0055)
  end

end
