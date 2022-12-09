require "2_solution"

describe "Rock Paper Scissors" do
  it "formats input" do
    test = RockPaperScissor.new("test_input.txt")
    p test
    expect(test.format_file).to eq([["A", "Y"], ["B", "X"], ["C", "Z"]])
  end

  it "calculates total of one game" do
    test = RockPaperScissor.new("test_input.txt")
    test.weapon_score
    test.game_score
    expect(test.running_score).to eq(15)
  end
end
