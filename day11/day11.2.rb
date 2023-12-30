# frozen_string_literal: true

def part2
  raw_graph = File.readlines(File.join(__dir__, 'input.txt'), chomp: true).map(&:chars)

  graph = duplicate_empty_rows(duplicate_empty_rows(raw_graph).transpose).transpose

  galaxies = []

  graph.each_with_index do |row, row_i|
    row.each_with_index do |char, col_i|
      next if char == '.'

      galaxies << [row_i, col_i]
    end
  end

  distances = galaxies.combination(2).map do |point1, point2|
    get_manhattan_distance(point1, point2)
  end

  distances.sum
end

def get_manhattan_distance(point1, point2)
  (point1[0] - point2[0]).abs + (point1[1] - point2[1]).abs
end

def duplicate_empty_rows(graph)
  new_graph = []
  graph.each do |row|
    new_graph << row
    new_graph << row if row.all?('.')
  end

  new_graph
end

def print_graph(graph)
  graph.each do |row|
    puts row.join
  end
end

puts "part 2: #{part2}"
