# frozen_string_literal: true

def part1
  maps = {}

  lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  groups = lines.slice_before('').map { |group| group.reject(&:empty?) }

  seeds = groups.shift.first.scan(/\d+/).map(&:to_i)

  groups.each do |group|
    maps[group.shift[0...-5]] = group.map do |str|
      dest, source, range = str.split.map(&:to_i)
      { dest:, source:, range: }
    end.sort_by { |h| h[:source] }
  end

  locations = []

  for seed in seeds do
    locations << map_seed_to_location(seed, maps)

  end

  locations.min
end

def process_group(maps, input, group_name)
  for group in maps[group_name] do
    return input - group[:source] + group[:dest] if input.between?(group[:source], group[:source] + group[:range])
  end
  input
end

def map_seed_to_location(seed, maps)
  soil = process_group(maps, seed, 'seed-to-soil')
  fertilizer = process_group(maps, soil, 'soil-to-fertilizer')
  water = process_group(maps, fertilizer, 'fertilizer-to-water')
  light = process_group(maps, water, 'water-to-light')
  temperature = process_group(maps, light, 'light-to-temperature')
  humidity = process_group(maps, temperature, 'temperature-to-humidity')
  process_group(maps, humidity, 'humidity-to-location')
end

def part2
  maps = {}

  lines = File.readlines(File.join(__dir__, 'input.txt'), chomp: true)

  groups = lines.slice_before('').map { |group| group.reject(&:empty?) }

  seeds = groups.shift.first.scan(/\d+/).map(&:to_i)

  inputs = Set.new

  let i = 0

  while i < seeds.length
    start = seeds[i]
    range = seeds[i + 1]
    inputs << (start..range)
  end

  groups.each do |group|
    maps[group.shift[0...-5]] = group.map do |str|
      dest, source, range = str.split.map(&:to_i)
      { dest:, source:, range: }
    end.sort_by { |h| h[:source] }
  end

  locations = []

  for seed in seeds do
    locations << map_seed_to_location(seed, maps)

  end

  locations.min
end

def process_group(maps, input, group_name)
  for group in maps[group_name] do
    return input - group[:source] + group[:dest] if input.between?(group[:source], group[:source] + group[:range])
  end
  input
end

# puts "part 1: #{part1}"
puts "part 2: #{part2}"
