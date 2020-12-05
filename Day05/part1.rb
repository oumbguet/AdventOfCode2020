file = File.open("input")
arr = file.readlines.map(&:chomp)
ids = []

def get_row(line)
    pow = 6
    a, b = 0, 127
    line.split("").each {|c|
        if (c == "F")
            b -= 2 ** pow
            pow -= 1
        elsif (c == "B")
            a += 2 ** pow
            pow -= 1
        end
    }
    return a
end

def get_col(line)
    pow = 2
    a, b = 0, 8
    line.split("").each {|c|
        if (c == "L")
            b -= 2 ** pow
            pow -= 1
        elsif (c == "R")
            a += 2 ** pow
            pow -= 1
        end
    }
    return a
end

arr.each {|line|
    row = get_row(line[0...-3])
    col = get_col(line[-3..-1])
    id = row * 8 + col
    ids.push(id)
}

puts ids.max()