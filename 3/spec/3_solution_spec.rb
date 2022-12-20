require "3_solution"

describe "Rucksack" do
  it "calculates total" do
    test = Rucksack.new("test_input.txt")
    expect(test.sum_of_types).to eq(157)
  end

  it "calculates total for shared item" do
    test = Rucksack.new("test_input.txt")
    expect(test.sum_of_shared_types).to eq(70)
  end
end

