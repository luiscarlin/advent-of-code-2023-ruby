# frozen_string_literal: true

def part1
  lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  answer = 0

  lines.each do |line|
    springs, groups = line.split(' ')
    groups = groups.split(',').map(&:to_i)

    answer += fun(springs, groups, 0)
  end

  'not yet implemented'
end

def fun(springs, groups, i)
  if i == springs.length
    return 1 if is_valid(springs, groups)

    return 0
  end

  return fun(springs, groups, i + 1) if springs[i] != '?'

  # char is ?
  springs_before_i = springs[0, i]
  springs_after_i = springs[i + 1, springs.length]

  damaged_i = "#{springs_before_i}##{springs_after_i}"
  operational_i = "#{springs_before_i}.#{springs_after_i}"

  fun(damaged_i, groups, i + 1) + fun(operational_i, groups, i + 1)
end

def is_valid(springs, groups); end

def part2
  File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  'not yet implemented'
end

puts "part 1: #{part1}"
puts "part 2: #{part2}"
