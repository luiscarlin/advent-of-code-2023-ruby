# frozen_string_literal: true

def convert(letter)
  case letter
  when 'A' then 14
  when 'J' then 1
  when 'Q' then 12
  when 'K' then 13
  when 'T' then 10
  else
    letter.to_i
  end
end

def get_type_points(matches)
  values = matches.values

  case values.length
  when 1 then 7
  when 2
    return 6 if values.include?(4) && values.include?(1)

    5 if values.include?(3) && values.include?(2)
  when 3
    return 4 if values.include?(3)

    3 if values.count(2) == 2
  when 4 then 2
  when 5 then 1
  end
end

def get_points_for_hand(hand)
  matches = hand.chars.each_with_object(Hash.new(0)) { |letter, counts| counts[letter] += 1 }

  get_type_points(matches)
end

def part2
  hands = File.readlines(File.join(__dir__, 'input.txt'), chomp: true).map do |line|
    hand, bid = line.split(' ')

    max_points = get_points_for_hand(hand)
    max_hand = hand

    hand.delete('J').each_char do |char|
      new_hand = hand.gsub(char, 'J')

      points = get_points_for_hand(new_hand)

      next unless points > max_points

      max_points = points
      max_hand = new_hand
    end

    {
      hand: max_hand,
      values: hand.chars.map { |c| convert(c) },
      bid: bid.to_i,
      rank: 0,
      matches:,
      type_points: max_points,
      score: 0
    }
  end

  sorted = hands.sort_by { |hand| [hand[:type_points]] + hand[:values] }

  sorted.each_with_index do |hand, index|
    hand[:rank] = index + 1
    hand[:score] = hand[:rank] * hand[:bid]
  end

  sorted.sum { |hand| hand[:score] }
end

puts "part 2: #{part2}"
