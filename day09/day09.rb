# frozen_string_literal: true

def part1
  lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  predicted_values = []

  lines.each do |line| 
    history_line = line.split(' ').map(&:to_i)

    diffs = [history_line]

    while !diffs.last.all? { |num| num == 0 } do
      line_to_process = diffs.last

      new_row = line_to_process.each_cons(2).map { |a, b| b - a }

      diffs << new_row
    end

    predicted_values << diffs.map(&:last).sum
  end

  predicted_values.sum
end

def part2
  File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  'not yet implemented'
end

puts "part 1: #{part1}"
# puts "part 2: #{part2}"
