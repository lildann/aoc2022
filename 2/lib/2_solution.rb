#!/usr/bin/env ruby

class RockPaperScissor
  attr_reader :running_score

  def initialize(file)
    @file = file
    @running_score = 0
    @results = format_file
    @weapon_conversion = { "A" => "X", "B" => "Y", "C" => "Z" }
    @weapons_selected = []
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
    @results.each do |weapon|
      @running_score += 1 if weapon[1] == "X"
      @running_score += 2 if weapon[1] == "Y"
      @running_score += 3 if weapon[1] == "Z"
    end
  end

  def calculate_total_part_1
    weapon_score
    game_score
    puts running_score
  end

  def choose_weapon
    @results.each do |weapon|
      @weapons_selected << @weapon_conversion[weapon[0]] if weapon[1] == "Y"
      @weapons_selected << @weapon_conversion["B"] if weapon[1] == "Z" && weapon[0] == "A"
      @weapons_selected << @weapon_conversion["C"] if weapon[1] == "Z" && weapon[0] == "B"
      @weapons_selected << @weapon_conversion["A"] if weapon[1] == "Z" && weapon[0] == "C"
      @weapons_selected << @weapon_conversion["A"] if weapon[1] == "X" && weapon[0] == "B"
      @weapons_selected << @weapon_conversion["B"] if weapon[1] == "X" && weapon[0] == "C"
      @weapons_selected << @weapon_conversion["C"] if weapon[1] == "X" && weapon[0] == "A" 
    end
  end

  def weapon_chosen_score
    choose_weapon
    @weapons_selected.each do |weapon|
      @running_score += 1 if weapon == "X"
      @running_score += 2 if weapon == "Y"
      @running_score += 3 if weapon == "Z"
    end
  end

  def pre_determine_game_score
    @results.each do |weapon|
      @running_score += 3 if weapon[1] == "Y"
      @running_score += 6 if weapon[1] == "Z"
    end
  end

  def calculate_total_part_2
    weapon_chosen_score
    pre_determine_game_score
    puts running_score
  end

end

RockPaperScissor.new("input.txt").calculate_total_part_1
RockPaperScissor.new("input.txt").calculate_total_part_2
