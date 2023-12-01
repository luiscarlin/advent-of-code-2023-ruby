def part1
    lines = File.readlines('input.txt', chomp: true).map { |line|
        numbers = line.scan(/\d/)
        (numbers.first + numbers.last).to_i
    }

    lines.sum
end

def part2
    lines = File.readlines('input.txt', chomp: true).map { |line|
        matches = []

        for i in 0..line.length - 1
            if line[i].to_i.to_s == line[i]
                matches << line[i]
            end

            %w[one two three four five six seven eight nine].each_with_index do |val, d|
                if line[i..].start_with?(val)
                    matches << (d+1).to_s
                end
            end
        end

        (matches.first + matches.last).to_i
    }
    lines.sum
end

puts "part 1: #{part1()}"
puts "part 2: #{part2()}" 
