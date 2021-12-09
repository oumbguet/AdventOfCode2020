file = File.open("input", "r")
data = file.readlines.map(&:chomp).map(&:to_i)

n = 1492208709

0.upto(data.length - 1) do |i|
    0.upto(data.length - 1 - i) do |j|
        res = data[i..(i + j)].reduce(:+)

        if res > n
            break
        end
        if res == n
            print data[i...(i + j)]
            puts ''
            puts data[i...(i + j)].max
            puts data[i...(i + j)].min

            puts ''
        end
    end
end

puts 189876168 + 48367338