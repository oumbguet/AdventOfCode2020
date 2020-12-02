file = File.open("input")
arr = file.readlines.map(&:chomp)
valid = 0

arr.each {|line|
    first = line.split("-")[0].to_i - 1
    second = line.split("-")[1].split(" ")[0].to_i - 1
    letter = line.split(" ")[1].split(":")[0]
    password = line.split(" ")[2]

    if ((password[first] == letter || password[second] == letter) && password[first] != password[second])
        valid += 1
    end
}

puts valid