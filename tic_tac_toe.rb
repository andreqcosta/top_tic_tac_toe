#   |   |    
# 0 | 0 | 0 
#___|___|___
#   |   |
# 0 | 0 | 0
#___|___|___
#   |   |
# 0 | 0 | 0
#   |   |



class TicTacToe
  
end
space = "\u{0020}"
cross = "\u{253C}"
v_line = "\u{2500}"
h_line = "\u{2502}"
circle = "\u{25EF}"
a = Array.new(3) { Array.new(3) {" "}}

5.times do |i|
  line = ""
  11.times do |j|
    if i.even?
      if j == 3 || j == 7
        line += h_line
      elsif j == 1 || j == 5 || j == 9
        line += a[i/2][(j -1) / 4]
      else
        line += space
      end
    else
      if  j == 3 || j == 7
        line += cross
      else
        line += v_line
      end
    end
  end
  if i.even?
    line = (2 - i / 2).to_s + "|" + line
  else
    line = " |" + line
  end
  puts line
end

puts " \u{2514}-----------"
puts "   0   1   2 "
