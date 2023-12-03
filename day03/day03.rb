# frozen_string_literal: true

def part1
  grid = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  rows = grid.length
  cols = grid[0].length

  coordinate_first_digit = Set.new

  (0...rows).each do |r|
    (0...cols).each do |c|
      next if grid[r][c].match?(/\d/) || grid[r][c] == '.'

      directions = [-1, 0, 1].product([-1, 0, 1]) - [[0, 0]]

      directions.each do |direction|
        dr = r + direction[0]
        dc = c + direction[1]

        next unless grid[dr][dc]&.match?(/\d/)

        first_c = dc
        first_c -= 1 while grid[dr][first_c - 1].match?(/\d/)

        coordinate_first_digit.add([dr, first_c])
      end
    end
  end

  coordinate_first_digit.map { |coord| find_full_number(grid, *coord) }.sum
end

def part2
  grid = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  rows = grid.length
  cols = grid[0].length

  gear_ratios = []

  (0...rows).each do |r|
    (0...cols).each do |c|
      next if grid[r][c] != '*'

      directions = [-1, 0, 1].product([-1, 0, 1]) - [[0, 0]]

      first_coordinates = Set.new

      directions.each do |direction|
        dr = r + direction[0]
        dc = c + direction[1]

        next unless grid[dr][dc]&.match?(/\d/)

        first_c = dc

        first_c -= 1 while grid[dr][first_c - 1].match?(/\d/)

        first_coordinates << [dr, first_c]
      end

      next unless first_coordinates.length == 2

      inner_nums = []

      first_coordinates.each do |coord|
        inner_nums << find_full_number(grid, *coord)
      end

      gear_ratios << inner_nums.reduce(:*)
    end
  end
  gear_ratios.sum
end

def find_full_number(grid, r, c)
  num = grid[r][c]

  while grid[r][c + 1]&.match?(/\d/)
    num += grid[r][c + 1]
    c += 1
  end

  num.to_i
end

puts "part 1: #{part1}"
puts "part 2: #{part2}"
