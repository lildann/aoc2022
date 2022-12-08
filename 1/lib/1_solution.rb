#!/usr/bin/env ruby

def format_file(file)
  File.read(file).split("\n\n").map { |nums| nums.split("\n").map(&:to_i) }
end

def most_calories(elves)
  sum_of_calories = elves.map { |elf| elf.sum }
  sum_of_calories.max
end

def top_three_elves(elves)
  sum_of_calories = elves.map { |elf| elf.sum }
  top_three = sum_of_calories.sort!.reverse![0..2]
  top_three.sum
end

puts "Highest calories of one elf: #{most_calories(format_file("input.txt"))}"
puts "Total calories of top three elves: #{top_three_elves(format_file("input.txt"))}"
