# frozen_string_literal: true

def convert(letter)
  case letter
  when 'A'
    return 14
  when 'J'
    return 11
  when 'Q'
    return 12
  when 'K'
    return 13
  when 'T'
    return 10
  end

  letter.to_i
end

def get_type_points(matches)
  case matches.values.length
  when 1
    7
  when 2
    if (matches.values[0] == 4 && matches.values[1] == 1) || (matches.values[0] == 1 && matches.values[1] == 4)
      # four of a kind
      6
    elsif (matches.values[0] == 3 && matches.values[1] == 2) || (matches.values[0] == 2 && matches.values[1] == 3)
      # full house
      5
    end
  when 3
    if matches.values[0] == 3 || matches.values[1] == 3 || matches.values[2] == 3
      # three of a kind
      4
    elsif (matches.values[0] == 2 && matches.values[1] == 2) || (matches.values[0] == 2 && matches.values[2] == 2) || (matches.values[1] == 2 && matches.values[2] == 2)
      # two pair
      3
    end
  when 4
    # flush
    2
  when 5
    # high card
    1
  end
end

def sort_hands(hands)
  # puts hands
end

def part1
  hands = []

  lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  lines.each do |line|
    hand, bid = line.split(' ')

    matches = {}

    hand.chars.each do |letter|
      matches[letter] = 0 unless matches[letter]
      matches[letter] += 1
    end

    type_points = get_type_points(matches)

    hands << { hand:, values: hand.split('').map do |c|
                                convert(c)
                              end, bid: bid.to_i, rank: 0, matches:, type_points:, score: 0 }
  end

  sorted = hands.sort_by { |hand| [hand[:type_points]] + hand[:values] }

  sorted.each_with_index do |hand, index|
    hand[:rank] = index + 1
    hand[:score] = hand[:rank] * hand[:bid]
  end

  puts(sorted.sum { |hand| hand[:score] })

  'to do'
end

def part2
  File.readlines(File.join(__dir__, 'input.txt'), chomp: true)
end

puts "part 1: #{part1}"
# puts "part 2: #{part2}"
