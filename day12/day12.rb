# frozen_string_literal: true

def part1
  lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  num_arrangements = 0

  lines.each do |line|
    springs, groups = line.split(' ')
    groups = groups.split(',').map(&:to_i)

    num_arrangements += calculate_arrangements(springs, groups, 0)
  end

  num_arrangements
end

def calculate_arrangements(springs, groups, i)
  if i == springs.length
    # we have reached the end of the string

    is_spring_valid = springs.scan(/#+/).map(&:length) == groups
    return 1 if is_spring_valid

    return 0
  end

  return calculate_arrangements(springs, groups, i + 1) if ['.', '#'].include?(springs[i])

  # at this point char is ?
  # find the number of arrangements when char is # and when char is .
  springs_before_i = springs[0, i]
  springs_after_i = springs[i + 1, springs.length]

  damaged_i = "#{springs_before_i}##{springs_after_i}"
  operational_i = "#{springs_before_i}.#{springs_after_i}"

  num_when_i_damaged = calculate_arrangements(damaged_i, groups, i + 1)
  num_when_i_operational = calculate_arrangements(operational_i, groups, i + 1)

  num_when_i_damaged + num_when_i_operational
end

def part2
  File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  'not yet implemented'
end

puts "part 1: #{part1}"
puts "part 2: #{part2}"
