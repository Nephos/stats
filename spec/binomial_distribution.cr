describe BinomialDistribution do

  it "simple instances" do
    0.0.step(by: 0.1, limit: 1.0) do |proba|
      Math.binomial_distribution(tries: 1, probability: proba, success: 1).should eq(proba)
    end
  end

end
