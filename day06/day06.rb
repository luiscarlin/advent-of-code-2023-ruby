# frozen_string_literal: true

def part1
  lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  times = lines[0].scan(/\d+/).map(&:to_i)
  distance = lines[1].scan(/\d+/).map(&:to_i)

  total_ways_to_reach = []

  times.each_with_index do |time, i|
    distance_to_cover = distance[i]

    num_ways_to_reach_distance = 0

    (0..time).each do |hold|
      time_running = time - hold

      distance_covered = time_running * hold

      num_ways_to_reach_distance += 1 if distance_covered > distance_to_cover
    end

    total_ways_to_reach << num_ways_to_reach_distance
  end

  total_ways_to_reach.reduce(:*)
end

def part2
  lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  time = lines[0].scan(/\d+/).join.to_i
  distance = lines[1].scan(/\d+/).join.to_i

  distance_to_cover = distance

  num_ways_to_reach_distance = 0

  (0..time).each do |hold|
    time_running = time - hold

    distance_covered = time_running * hold

    num_ways_to_reach_distance += 1 if distance_covered > distance_to_cover
  end

  num_ways_to_reach_distance
end

puts "part 1: #{part1}"
puts "part 2: #{part2}"
