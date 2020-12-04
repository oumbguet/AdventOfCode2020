file = File.open("input")
arr = file.read.split("\n\n").map {|str|
    str.gsub(/[\n]/, ' ').split(" ").map {|s|
        s.split(":")
    }
}
count = 0

def check_passport(map)
    map.each {|key, value|
        if value == "" && key != "cid"
            return false
        end
    }
    return true
end


for i in 0...arr.length
    map = {
        "byr" => "",
        "iyr" => "",
        "eyr" => "",
        "hgt" => "",
        "hcl" => "",
        "ecl" => "",
        "pid" => "",
        "cid" => ""
    }
    arr[i].each {|w|
        map[w[0]] = w[1]
    }
    count += check_passport(map) ? 1 : 0;
end

puts count