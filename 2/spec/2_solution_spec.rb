require "2_solution"

describe "Rock Paper Scissors" do
  it "formats input" do
    test = RockPaperScissor.new("test_input.txt")
    expect(test.format_file).to eq([["A", "Y"], ["B", "X"], ["C", "Z"]])
  end

  it "calculates total of one game (part 1 logic)" do
    test = RockPaperScissor.new("test_input.txt")
    test.calculate_total_part_1
    expect(test.running_score).to eq(15)
  end

  it "calculates total of one game (part 2 logic)" do
    test = RockPaperScissor.new("test_input.txt")
    test.calculate_total_part_2
    expect(test.running_score).to eq(12)
  end

end
