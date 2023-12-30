# frozen_string_literal: true

def part2
  grid = File.readlines(File.join(__dir__, 'input.txt'), chomp: true).map(&:chars)

  s_row = grid.find_index { |row| row.include?('S') }
  s_col = grid[s_row].index('S')

  queue = [[s_row, s_col]]
  visited = []

  while queue.length.positive?
    current_tile = queue.shift

    neighbors = get_neighbor_tiles(grid, current_tile)

    non_visited_neighbors = neighbors.reject { |neighbor| visited.include?(neighbor) }

    queue += non_visited_neighbors
    queue.uniq!

    visited << current_tile
    visited.uniq!
  end

  # print_visible_loop(grid, visited)

  visited.length / 2
end

def get_neighbor_tiles(grid, current_tile)
  rows = grid.length
  cols = grid[0].length

  current_tile_row = current_tile[0]
  current_tile_col = current_tile[1]
  current_tile_value = grid[current_tile_row][current_tile_col]

  directions = [
    [-1, 0], # up
    [0, 1], # right
    [1, 0], # down
    [0, -1] # left
  ]

  allowed_from = [
    ['|', 'J', 'L'], # up
    ['-', 'L', 'F'], # right
    ['|', 'F', '7'], # down
    ['-', 'J', '7'] # left
  ]

  allowed_to = [
    ['|', '7', 'F'], # up
    ['-', 'J', '7'], # right
    ['|', 'J', 'L'], # down
    ['-', 'L', 'F'] # left
  ]

  neighbors = []

  directions.each_with_index do |direction, index|
    neighbor_tile_row = current_tile[0] + direction[0]
    neighbor_tile_col = current_tile[1] + direction[1]

    next unless neighbor_tile_row.between?(0, rows - 1) && neighbor_tile_col.between?(0, cols - 1)

    neighbor_tile_value = grid[neighbor_tile_row][neighbor_tile_col]

    next unless allowed_from[index].include?(current_tile_value) || current_tile_value == 'S'
    next unless allowed_to[index].include?(neighbor_tile_value) || neighbor_tile_value == 'S'

    neighbors << [neighbor_tile_row, neighbor_tile_col]
  end

  neighbors
end

def print_visible_loop(grid, visited)
  grid.each_with_index do |row, row_index|
    row.each_with_index do |_col, col_index|
      if visited.include?([row_index, col_index])
        print grid[row_index][col_index]
      else
        print '.'
      end
    end
    puts
  end
end

puts "part 2: #{part2}"
