file = File.open("input")
arr = file.read.split("\n\n")
count = 0

arr.each {|group|
    a = ['Z'] + group.split("\n")[0].split("")
    group.split("\n")[1..-1].each {|line|
        a[1..-1].each {|c|
            if line.split("").count(c) == 0
                a.delete(c)
            end
        }
    }
    puts a
    count += a.length - 1
}

puts count