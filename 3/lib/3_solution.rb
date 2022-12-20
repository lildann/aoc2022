#!/usr/bin/env ruby

class Rucksack
  attr_reader :items

  def initialize(items)
    @items = File.read(items).split("\n")
    @groups_of_three = @items.each_slice(3).to_a
    @duplicates = []
    @scores = []
    @shared = []
  end

  def find_duplicates
    @items.each do |item|
      i = item.length/2
      duplicate = item[0...i].split("") & item[i..-1].split("")
      @duplicates << duplicate
    end
    @duplicates.flatten!
  end

  def find_shared_item
    @groups_of_three.each do |group|
      group[0].split("").uniq.each { |letter| @shared << letter if group[1].include?(letter) &&  group[2].include?(letter) }
    end
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

  def sum_of_shared_types
    get_scores
    find_shared_item
    total = []
    @shared.each { |item| @scores.each { |letter, score| total << score if item == letter } }
    total.sum
  end
end

p Rucksack.new("input.txt").sum_of_types
p Rucksack.new("input.txt").sum_of_shared_types


