require "big"

describe Math::Correlation do
  it "test basic confidence interval" do
    arr1 = [1, 2, 2.5, 3, 3.5, 3.8, 4, 4.2, 4.4, 4.5]
    arr2 = [1, 2, 3, 4, 5, 6.5, 8, 10, 12, 15]
    arr1.mean.round(4).should eq 3.29
    arr2.mean.round(4).should eq 6.65
    arr1.size.should eq 10
    arr2.size.should eq 10
    arr1.covariance(arr2).round(4).should eq 4.2215
    arr1.correlation_coef(arr2).round(4).should eq 0.8906
  end

  it "test big" do
    [BigInt.new(1), 2].correlation_coef([2, 3])
    [1, 2].correlation_coef([BigInt.new(2), 3])
    [BigInt.new(1), 2].correlation_coef([BigInt.new(2), 3])
    [1, 2].correlation_coef([BigInt.new(2), BigInt.new(3)])
  end
end
