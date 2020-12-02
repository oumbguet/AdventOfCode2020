file = File.open("input")
arr = file.readlines.map(&:chomp)
valid = 0

arr.each {|line|
    min = line.split("-")[0].to_i;
    max = line.split("-")[1].split(" ")[0].to_i
    letter = line.split(" ")[1].split(":")[0]
    password = line.split(" ")[2]
    count = password.count(letter)

    puts line + " " + count.to_s
    if (count >= min && count <= max)
        valid += 1
    end
}

puts valid