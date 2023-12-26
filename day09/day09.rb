# frozen_string_literal: true

def part1
  lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  predicted_values = []

  lines.each do |line|
    history_line = line.split(' ').map(&:to_i)

    diffs = [history_line]

    until diffs.last.all?(&:zero?)
      line_to_process = diffs.last

      new_row = line_to_process.each_cons(2).map { |a, b| b - a }

      diffs << new_row
    end

    predicted_values << diffs.map(&:last).sum
  end

  predicted_values.sum
end

def part2
  lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  predicted_values = []

  lines.each do |line|
    history_line = line.split(' ').map(&:to_i)

    diffs = [history_line]

    until diffs.last.all?(&:zero?)
      line_to_process = diffs.last

      new_row = line_to_process.each_cons(2).map { |a, b| b - a }

      diffs << new_row
    end

    rolling = 0

    first_nums = diffs.map(&:first).reverse

    first_nums.each_with_index do |val, index|
      next if index.zero?

      rolling = val - rolling
    end
    predicted_values << rolling
  end

  predicted_values.sum
end

puts "part 1: #{part1}"
puts "part 2: #{part2}"
