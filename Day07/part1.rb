file = File.open("input", "r")
data = file.readlines.map(&:chomp)

colors = data.map { |line| line.split(" ")[0..1].join(' ') }.uniq

def getColor(line)
    line.split(" ")[0..1].join(' ')
end

def contain_color(color, data)
    return data.select { |line| line.include?(color) && getColor(line) != color }
end

cont = ["shiny gold"]
total = 0

result = []

while (cont.length > 0)
    tmp = []
    
    cont.each do |line|
        tmp += contain_color(getColor(line), data).map{ |line| getColor(line) }
    end
    
    result += tmp.uniq
    
    cont = tmp.uniq
end

puts result.uniq.length