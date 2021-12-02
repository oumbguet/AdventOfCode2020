file = File.open("input", "r")
data = file.readlines.map(&:chomp)

def count_slope_tree(right_slope, down_slope, data)
    trees_count = 0

    right_index = 0
    down_index = 0

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

    return trees_count

end

slopes_to_test = [[1, 1], [3, 1], [5, 1], [7, 1], [1, 2]]

result = slopes_to_test.reduce(1) do |acc, slope|
    acc * count_slope_tree(slope[0], slope[1], data)
end

puts result