file = File.open("input", "r")
data = file.readlines.map(&:chomp)

colors = data.map { |line| line.split(" ")[0..1].join(' ') }.uniq

def getColor(line)
    line.split(" ")[0..1].join(' ')
end

colors_dict = {}

def colors_inside(color, data, colors_dict)
    line = data.select { |line| getColor(line) == color }
    colors = line[0].scan(/[0-9]+\s[a-z]+\s[a-z]+/).map { |color| color.split(" ")[1..2].join(' ') }

    colors.each do |color|
        colors_dict[color] ? colors_dict[color] += colors_inside(color, data, colors_dict) : colors_dict[color] = colors_inside(color, data, colors_dict)
    end

    return line[0].scan(/[0-9]+\s[a-z]+\s[a-z]+/).reduce(0) { |sum, line| sum + line.split(" ")[0].to_i }
end

def get_bags(color, data, colors_dict)
    line = data.select { |line| getColor(line) == color }
    colors = line[0].scan(/[0-9]+\s[a-z]+\s[a-z]+/)
    local_total = 0

    co = color

    if colors.length == 0
        return 1
    else
        colors.each do |color|
            n = color.split(" ")[0].to_i
            c = color.split(" ")[1..2].join(' ')
            n_bags = get_bags(c, data, colors_dict)
            local_total += (n_bags == 1 ? 0 : n) + n * n_bags
            # puts "#{co} contains #{n} #{c}, local_total: #{local_total}"
        end

        return local_total
    end

end

cont = ["shiny gold"]

colors_dict["shiny gold"] = colors_inside("shiny gold", data, colors_dict)

puts get_bags("shiny gold", data, colors_dict)

