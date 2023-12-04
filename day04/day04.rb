# frozen_string_literal: true

def part1
  winning = []
  yours = []
  points = 0

  File.readlines(File.join(__dir__, 'input.txt'), chomp: true).each do |line|
    _, line_winning, line_yours = line.split(/[:|]/)

    winning << line_winning.split(' ').map(&:to_i)
    yours << line_yours.split(' ').map(&:to_i)
  end

  winning.length.times do |i|
    num_matches = yours[i].intersection(winning[i]).length

    next if num_matches.zero?

    card_point = 1

    (1...num_matches).each do
      card_point *= 2
    end

    points += card_point
  end

  points
end

def part2
  File.readlines(File.join(__dir__, 'input.txt'), chomp: true)
end

puts "part 1: #{part1}"
# puts "part 2: #{part2}"
