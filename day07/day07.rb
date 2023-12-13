# frozen_string_literal: true

def part1
  # hands = []
  bids = []

  hands = []

  lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  lines.each do |line|
    hand, bid = line.split(' ')

    hands << { hand:, bid: }
  end

  p hands[0]

  # puts 'hello bashi bashi'
end

def part2
  File.readlines(File.join(__dir__, 'input.txt'), chomp: true)
end

puts "part 1: #{part1}"
# puts "part 2: #{part2}"
