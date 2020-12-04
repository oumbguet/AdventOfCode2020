file = File.open("input")
arr = file.read.split("\n\n").map {|str|
    str.gsub(/[\n]/, ' ').split(" ").map {|s|
        s.split(":")
    }
}
count = 0

def is_num(value)
    if value.length != 4
        return false
    end
    value.split("").each {|c|
        if (c < '0' || c > '9')
            return false
        end
    }
    return true
end

def check_byr(value)
    if !is_num(value)
        return false
    end
    if value.to_i < 1920 || value.to_i > 2002
        return false
    end
    return true
end

def check_iyr(value)
    if !is_num(value)
        return false
    end
    if value.to_i < 2010 || value.to_i > 2020
        return false
    end
    return true
end

def check_eyr(value)
    if !is_num(value)
        return false
    end
    if value.to_i < 2020 || value.to_i > 2030
        return false
    end
    return true
end

def check_hgt(value)
    nb = value[0...-2]
    ec = value[-2...value.length]

    if ec != "cm" && ec != "in"
        return false
    end
    nb.split("").each {|c|
        if (c < '0' || c > '9')
            return false
        end
    }
    if (ec == "cm" && (nb.to_i < 150 || nb.to_i > 193)) || (ec == "in" && (nb.to_i < 59 || nb.to_i > 76))
        return false
    end
    return true
end

def check_hcl(value)
    if value[0] != '#'
        return false
    end
    value[1..-1].split("").each {|c|
        if !((c >= '0' && c <= '9') || (c >= 'a' && c <= 'z'))
            return false
        end
    }
    return true
end

def check_ecl(value)
    arr = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]

    arr.each {|c|
        if value == c
            return true
        end
    }
    return false
end

def check_pid(value)
    if value.length != 9
        return false
    end
    value.split("").each {|c|
        if (c < '0' || c > '9')
            return false
        end
    }
    return true
end

def check_passport(map)
    map.each {|key, value|
        if value == "" && key != "cid"
            return false
        end
        if key == "byr" && !check_byr(value)
            return false;
        end
        if key == "iyr" && !check_iyr(value)
            return false;
        end
        if key == "eyr" && !check_eyr(value)
            return false;
        end
        if key == "hgt" && !check_hgt(value)
            return false;
        end
        if key == "hcl" && !check_hcl(value)
            return false;
        end
        if key == "ecl" && !check_ecl(value)
            return false;
        end
        if key == "pid" && !check_pid(value)
            return false;
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