require "1_solution"

describe "Elves and Calories" do
  it "formats input" do
    expect(format_file("test_input.txt")).to eq([[1000, 2000, 3000], [4000], [5000, 6000], [7000, 8000, 9000], [10000]])
  end

  it "returns the total calories of the elf carrying the most snacks" do
    expect(most_calories(format_file("test_input.txt"))).to eq(24000)
  end
end
