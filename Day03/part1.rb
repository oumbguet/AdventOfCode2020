file = File.open("input", "r")
data = file.readlines.map(&:chomp)

right_index = 0
down_index = 0

right_slope = 3
down_slope = 1

trees_count = 0

while true do
    right_index = (right_index + right_slope) % data[0].length
    down_index += down_slope

    if down_index >= data.length
        break
    end
    current = data[down_index][right_index]

    if current == '#'
        trees_count += 1
    end
end

puts trees_count