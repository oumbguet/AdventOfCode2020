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
            puts "Accumulator: " + accumulator.to_s
            return true
        end

        cmd, value = parse_line(data[index])

        if visited_index.include?(index)
            puts "INFINITE LOOP"
            return false
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
    end
end

def swap_cmd(line)
    parsed = parse_line(line)

    if parsed[0] == "nop"
        return line.sub("nop", "jmp")
    elsif parsed[0] == "jmp"
        return line.sub("jmp", "nop")
    end
    return line
end

def brute_force(data)
    index = 0
    stop_cond = false

    while !stop_cond do
        data_copy = data.dup
        
        line = data_copy[index]
        swap_line = swap_cmd(line)

        data_copy[index] = swap_line

        stop_cond = execute_code(data_copy)

        index += 1
    end

    puts "Index: " + index.to_s
end

brute_force(data)