# frozen_string_literal: true

def part1
  lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true).map do |line|
    numbers = line.scan(/\d/)

    (numbers.first + numbers.last).to_i
  end
  lines.sum
end

def part2
  lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true).map do |line|
    matches = []

    (0..line.length - 1).each do |i|
      matches << line[i] if line[i].to_i.to_s == line[i]

      %w[one two three four five six seven eight nine].each_with_index do |val, d|
        matches << (d + 1).to_s if line[i..].start_with?(val)
      end
    end

    (matches.first + matches.last).to_i
  end
  lines.sum
end

puts "part 1: #{part1}"
puts "part 2: #{part2}"
