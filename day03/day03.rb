# frozen_string_literal: true

def part1
  grid = []

  File.foreach(File.join(__dir__, 'input.txt'), chomp: true) { |line| grid << line }

  rows = grid.length
  cols = grid[0].length

  coordinate_first_digit = Set.new

  (0..rows - 1).each do |r|
    (0..cols - 1).each do |c|
      # get all the symbols
      next if grid[r][c].match?(/\d/) || grid[r][c] == '.'

      directions = [
        # up
        [-1, 0],
        # up-right
        [-1, 1],
        # up-left
        [-1, -1],
        # down,
        [1, 0],
        # down-right
        [1, 1],
        # down-left
        [1, -1],
        # left
        [0, -1],
        # right
        [0, 1]
      ]

      # get numbers around the symbol
      directions.each do |direction|
        dr = r + direction[0]
        dc = c + direction[1]

        next unless grid[dr][dc]&.match?(/\d/)

        # we have an number, so find coordinate of the beginning of the number and save it
        first_c = dc

        first_c -= 1 while grid[dr][first_c - 1].match?(/\d/)

        coordinate_first_digit.add([dr, first_c])
      end
    end
  end
  # find the full number
  nums = []

  coordinate_first_digit.each do |coord|
    r = coord[0]
    c = coord[1]

    num = grid[r][c]

    while grid[r][c + 1]&.match?(/\d/)
      num += grid[r][c + 1]
      c += 1
    end

    nums << num.to_i
  end

  nums.sum
end

# def part2
#   power_per_row = []

#   File.foreach(File.join(__dir__, 'input.txt')) do |line|
#     _, rest = line.split(':')

#     max_colors_seen = {}

#     num_and_colors = rest.split(/[,;]/).map(&:strip)

#     num_and_colors.each do |num_color_pair|
#       num, color = num_color_pair.split(' ')

#       max_colors_seen[color] = [max_colors_seen[color].to_i, num.to_i].max
#     end

#     power_per_row << max_colors_seen.values.reduce(:*)
#   end

#   power_per_row.sum
# end

puts "part 1: #{part1}"
# puts "part 2: #{part2}"
