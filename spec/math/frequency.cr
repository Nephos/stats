FREQ_LIMIT = 100

describe Math::Frequency do
  it "test trivia" do
    ([]of Int32).frequency_of(0).should eq 0.0
    [0, 1, 2, 3].frequency_of(0).should eq 0.25
    [0, 0, 1, 2, 3].frequency_of(0).should eq 0.40
  end

  it "test basic" do
    FREQ_LIMIT.times do |modi|
      modulo = modi + 1
      # we should have the same or more because we don't / modulo in the freq
      arr = FREQ_LIMIT.times.to_a.map { |e| e % modulo }
      (arr.frequency_of(0) >= (1.0f64 / modulo)).should be_true

      next if modulo <= 20
      # make an array with less or equal amount of iterations
      arr_less = FREQ_LIMIT.times.to_a.map { |e| e % (modulo + 5) }
      (arr.frequency_of(0) >= arr_less.frequency_of(0)).should be_true

      # make an array with more or equal amount of iterations
      arr_more = FREQ_LIMIT.times.to_a.map { |e| e % (modulo - 5) }
      (arr.frequency_of(0) <= arr_more.frequency_of(0)).should be_true
    end
  end
end
