# frozen_string_literal: true

def part1
  games_that_passed = []

  File.foreach(File.join(__dir__, 'input.txt')) do |line|
    game, rest = line.split(':')

    game_num = game.strip.scan(/\d+/).first.to_i

    num_and_colors = rest.split(/[,;]/).map(&:strip)

    did_pass = num_and_colors.all? do |num_color_pair|
      num, color = num_color_pair.split(' ')

      case color
      when 'red'
        num.to_i <= 12
      when 'green'
        num.to_i <= 13
      when 'blue'
        num.to_i <= 14
      else
        true
      end
    end

    games_that_passed << game_num if did_pass
  end

  games_that_passed.sum
end

def part2
  power_per_row = []

  File.foreach(File.join(__dir__, 'input.txt')) do |line|
    _, rest = line.split(':')

    max_colors_seen = {}

    num_and_colors = rest.split(/[,;]/).map(&:strip)

    num_and_colors.each do |num_color_pair|
      num, color = num_color_pair.split(' ')

      max_colors_seen[color] = [max_colors_seen[color].to_i, num.to_i].max
    end

    power_per_row << max_colors_seen.values.reduce(:*)
  end

  power_per_row.sum
end

puts "part 1: #{part1}"
puts "part 2: #{part2}"
