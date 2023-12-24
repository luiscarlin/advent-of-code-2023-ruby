# frozen_string_literal: true

def part1
  lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  instructions = lines.shift

  node_connections = {}

  lines.each do |line|
    next if line.empty?

    node, left, right = line.scan(/\w+/)

    node_connections[node] = { right:, left: }
  end

  current_node = 'AAA'
  num_steps = 0

  while current_node != 'ZZZ'
    direction = instructions[num_steps % instructions.length]

    current_node = node_connections[current_node][direction == 'R' ? :right : :left]
    num_steps += 1
  end

  num_steps
end

def part2
  lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  instructions = lines.shift

  node_connections = {}

  current_nodes = []

  lines.each do |line|
    next if line.empty?

    node, left, right = line.scan(/\w+/)

    current_nodes << node if node.end_with?('A')

    node_connections[node] = { right:, left: }
  end

  num_steps = 0

  repeats_every = []

  until current_nodes.all? { |node| node.end_with?('Z') } || repeats_every.compact.length == current_nodes.length

    direction = instructions[num_steps % instructions.length]

    current_nodes.each_with_index do |node, index|
      current_nodes[index] = node_connections[node][direction == 'R' ? :right : :left]
    end

    num_steps += 1

    next unless current_nodes.any? { |node| node.end_with?('Z') }

    current_nodes.each_with_index do |node, index|
      next unless node.end_with?('Z') && !repeats_every[index]

      repeats_every[index] = num_steps
    end
  end

  repeats_every.reduce(:lcm)
end

puts "part 1: #{part1}"
puts "part 2: #{part2}"
