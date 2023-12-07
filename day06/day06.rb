# frozen_string_literal: true

def part1
  lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  times, distances = lines.map { |line| line.scan(/\d+/).map(&:to_i) }

  total_ways_to_reach = times.map.with_index do |time, i|
    distance_to_cover = distances[i]

    (0..time).count { |hold| (time - hold) * hold > distance_to_cover }
  end

  total_ways_to_reach.reduce(:*)
end

def part2
  lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  time, distance = lines.map { |line| line.scan(/\d+/).join.to_i }

  (0..time).count do |hold|
    time_running = time - hold
    distance_covered = time_running * hold
    distance_covered > distance
  end
end

puts "part 1: #{part1}"
puts "part 2: #{part2}"
