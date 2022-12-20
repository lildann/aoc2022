#!/usr/bin/env ruby

class Rucksack
  attr_reader :items

  def initialize(items)
    @items = File.read(items).split("\n")
    @duplicates = []
    @scores = []
  end

  def find_duplicates
    @items.each do |item|
      i = item.length/2
      duplicate = item[0...i].split("") & item[i..-1].split("")
      @duplicates << duplicate
    end
    @duplicates.flatten!
  end

  def get_scores
    lower_case = ('a'..'z').each_with_object({}).with_index { |(char, result), index| result[char] = index + 1 }
    @scores =('A'..'Z').each_with_object(lower_case).with_index { |(char, result), index| result[char] = index + 27 }
  end

  def sum_of_types
    get_scores
    find_duplicates
    total = []
    @duplicates.each { |duplicate| @scores.each { |letter, score| total << score if duplicate == letter } }
    total.sum
  end
end

p Rucksack.new("input.txt").sum_of_types


