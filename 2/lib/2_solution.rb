#!/usr/bin/env ruby

class RockPaperScissor
  attr_reader :running_score

  def initialize(file)
    @file = file
    @running_score = 0
    @results = format_file
  end

  def format_file
    File.read(@file).split("\n").map { |pairs| pairs.split(" ") }
  end

  def game_score
    @results.each do |result|
      @running_score += 3 if result[0] == "A" && result[1] == "X" || result[0] == "B" && result[1] == "Y" || result[0] == "C" && result[1] == "Z"
      @running_score += 6 if result[0] == "C" && result[1] == "X" || result[0] == "B" && result[1] == "Z" || result[0] == "A" && result[1] == "Y"
    end
  end

  def weapon_score
    score = 0
    @results.each do |weapon|
      @running_score += 1 if weapon[1] == "X"
      @running_score += 2 if weapon[1] == "Y"
      @running_score += 3 if weapon[1] == "Z"
    end
  end

  def calculate_total
    weapon_score
    game_score
    puts running_score
  end

end

RockPaperScissor.new("input.txt").calculate_total

