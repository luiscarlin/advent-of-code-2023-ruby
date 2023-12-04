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
  winning = []
  yours = []
  num_of_cards = []

  File.foreach(File.join(__dir__, 'input.txt')) do |line|
    _, line_winning, line_yours = line.split(/[:|]/)

    winning << line_winning.split.map(&:to_i)
    yours << line_yours.split.map(&:to_i)
  end

  num_matches = yours.zip(winning).map { |y, w| (y & w).length }

  num_of_cards = Array.new(winning.length, 1)

  num_matches.each_with_index do |matches, current_card_index|
    next if matches.zero?

    num_of_cards[current_card_index..(current_card_index + matches)].each do |card|
      card += 1
    end
  end

  num_of_cards.sum
end

puts "part 1: #{part1}"
puts "part 2: #{part2}"
