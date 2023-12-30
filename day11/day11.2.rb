# frozen_string_literal: true

def part2
  raw_graph = File.readlines(File.join(__dir__, 'input.txt'), chomp: true).map(&:chars)

  sums = []
  (2..3).each do |i|
    graph = duplicate_empty_rows(duplicate_empty_rows(raw_graph, i).transpose, i).transpose
    galaxies = get_galaxies_coords(graph)

    distances = galaxies.combination(2).map do |point1, point2|
      get_manhattan_distance(point1, point2)
    end

    sums << distances.sum
    # puts "repeat: #{i}, distances: #{distances.join(',')}, sum: #{distances.sum}"
  end

  # puts "sums: #{sums.join(',')}"
  sums[0] + ((sums[1] - sums[0]) * (1_000_000 - 2))
end

def get_galaxies_coords(graph)
  graph.each_with_index.with_object([]) do |(row, row_i), galaxies|
    row.each_with_index do |char, col_i|
      galaxies << [row_i, col_i] unless char == '.'
    end
  end
end

def get_manhattan_distance(point1, point2)
  point1.zip(point2).sum { |a, b| (a - b).abs }
end

def duplicate_empty_rows(graph, replace_times)
  new_graph = []
  graph.each do |row|
    if row.all?('.')
      replace_times.times { new_graph << row }
    else
      new_graph << row
    end
  end

  new_graph
end

def print_graph(graph)
  puts graph.map(&:join)
end

puts "part 2: #{part2}"
