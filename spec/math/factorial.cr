describe Math do

  it "factorial" do
    Math.factorial(0).should eq 1
    Math.factorial(1).should eq 1
    Math.factorial(2).should eq 2
    Math.factorial(3).should eq 6
    Math.factorial(4).should eq 24
    Math.factorial(5).should eq 120
    Math.factorial(6).should eq 720
  end

end
