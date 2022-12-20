require "3_solution"

describe "Rucksack" do
  it "calculates total)" do
    test = Rucksack.new("test_input.txt")
    expect(test.sum_of_types).to eq(157)
  end
end

