file = File.open("input")
arr = file.readlines.map(&:chomp)
valid = 0
map = []
bottom_ind = 0
right_ind = 0
x = 0
slope = 3
count = 0
result = 1

arr.each {|line|map.push(line.split(""))}
bottom_ind = map.length
right_ind = map[0].length

for slope in [1, 3, 5, 7]
    for i in (0...bottom_ind)
        if (x >= right_ind)
            x -= right_ind
        end
        if (map[i][x] == "#")
            count += 1
        end
        x += slope
    end
    puts slope.to_s + " 1 " + count.to_s
    result *= count
    count = 0
    x = 0
end

for i in (0...bottom_ind)
    if i % 2 != 0
        next
    end
    if (x >= right_ind)
        x -= right_ind
    end
    if (map[i][x] == "#")
        count += 1
    end
    x += 1
end
puts "1 2 " + count.to_s
result *= count
puts result