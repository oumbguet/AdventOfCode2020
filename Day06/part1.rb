file = File.open("input")
arr = file.read.split("\n\n")
count = 0

arr.each {|group|
    a = []
    group.split("\n").each {|line|
        line.split("").each {|c|
            if a.count(c) == 0
                a.push(c)
            end
        }
    }
    count += a.length
}

puts count