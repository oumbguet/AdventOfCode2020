file = File.open("input", "r")
data = file.readlines.map(&:chomp)

def parse_line(line)
    return [line.split(" ")[0], line.split(" ")[1].to_i]
end

def execute_code(data)
    visited_index = []
    accumulator = 0
    index = 0

    while true do
        if data[index] == nil
            puts accumulator
        end

        cmd, value = parse_line(data[index])

        if visited_index.include?(index)
            puts "INFINITE LOOP"
            break
        end

        visited_index << index
        
        if cmd == "nop"
            index += 1
        elsif cmd == "acc"
            accumulator += value
            index += 1
        elsif cmd == "jmp"
            index += value
        end
        puts [cmd, value, accumulator].join(' ')
    end
end

execute_code(data)