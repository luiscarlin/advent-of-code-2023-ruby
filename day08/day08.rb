# frozen_string_literal: true

def part1
  lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  instructions = lines.shift

  graph = {}

  lines.each do |line|
    next if line.empty?

    node, left, right = line.scan(/\w+/)

    graph[node] = { right:, left: }
  end

  node = 'AAA'
  steps = 0

  while node != 'ZZZ'
    direction = instructions[steps % instructions.length]

    if direction == 'R'
      node = graph[node][:right]
    elsif direction == 'L'
      node = graph[node][:left]
    end

    steps += 1
  end

  steps
end

def part2
  File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  'not yet implemented'
end

puts "part 1: #{part1}"
puts "part 2: #{part2}"
