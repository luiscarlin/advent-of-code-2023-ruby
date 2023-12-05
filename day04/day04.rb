# frozen_string_literal: true

def part1
  winning = []
  yours = []
  points = 0

  File.foreach(File.join(__dir__, 'input.txt')) do |line|
    _, line_winning, line_yours = line.split(/[:|]/)

    winning << line_winning.split.map(&:to_i)
    yours << line_yours.split.map(&:to_i)
  end

  winning.each_with_index do |winning_numbers, i|
    num_matches = (yours[i] & winning_numbers).length

    next if num_matches.zero?

    card_point = 2**(num_matches - 1)

    points += card_point
  end

  points
end

def part2
  File.readlines(File.join(__dir__, 'input.txt'), chomp: true)
  winning = []
  yours = []
  num_matches = []

  File.readlines(File.join(__dir__, 'input.txt'), chomp: true).each do |line|
    _, line_winning, line_yours = line.split(/[:|]/)

    winning << line_winning.split(' ').map(&:to_i)
    yours << line_yours.split(' ').map(&:to_i)
  end

  num_of_cards = Array.new(winning.length, 1)

  winning.length.times do |i|
    num_matches[i] = yours[i].intersection(winning[i]).length
  end

  num_matches.each_with_index do |matches, currect_card_index|
    next if matches.zero?

    num_of_cards[currect_card_index].times do
      (1..matches).each do |i|
        num_of_cards[i + currect_card_index] += 1
      end
    end
  end

  num_of_cards.sum
end

puts "part 1: #{part1}"
puts "part 2: #{part2}"
