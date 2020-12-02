file = File.open("input")
arr = file.readlines.map(&:chomp).map(&:to_i)

for i in 0...arr.length
    for j in i + 1...arr.length
        if (arr[i] + arr[j] == 2020)
            puts [arr[i].to_s, arr[j].to_s, (arr[i] * arr[j]).to_s].join(" ")
        end
    end
end