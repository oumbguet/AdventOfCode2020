file = File.open("input", "r")
data = file.readlines.map(&:chomp).map(&:to_i)

def get_last_n(n, data, index)
  return data[(index - n)...index]
end

def find_sum(data, n)
    0.upto(data.length - 1) do |i|
        0.upto(data.length - 1) do |j|
            if i == j
                next
            end

            if data[i] + data[j] == n
                return true
            end
        end
    end
    return false
end

range = 25

range.upto(data.length - 1) do |i|
    ranged_data = get_last_n(range, data, i)

    if !find_sum(ranged_data, data[i])
        puts data[i]
        break
    end
end