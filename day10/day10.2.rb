# frozen_string_literal: true

def part2
  grid = File.readlines(File.join(__dir__, 'main_pipe.txt'), chomp: true).map(&:chars)

  answer = 0

  grid.each_with_index do |row, _row_index|
    row.each_with_index do |char, col_index|
      next if char != '.'

      num_crossings = get_number_of_crossings(row, col_index)
      answer += 1 if num_crossings.odd?
    end
  end

  answer
end

def get_number_of_crossings(row, col_index)
  count = 0

  (0...col_index).each do |k|
    count += 1 if ['J', 'L', '|'].include?(row[k])
  end
  count
end

def print_grid(grid)
  grid.each_with_index do |row, row_index|
    row.each_with_index do |_col, col_index|
      print grid[row_index][col_index]
    end
    puts
  end
end

puts "part 2: #{part2}"
