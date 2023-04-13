#   |   |    
# 0 | 0 | 0 
#___|___|___
#   |   |
# 0 | 0 | 0
#___|___|___
#   |   |
# 0 | 0 | 0
#   |   |
# color \e[30-38mtext\e[0m


class TicTacToe

  def play_game
    intro
    mode = player_input(1)
    game(mode)
  end

  def game(mode)
    if mode = 1
      pvp_game
    end
  end

  def pvp_game
    player = 'x'
    loop do
      player = player == 'x' ? '0' : 'x'
      
    end
    check_game
  end

  def check_game

  end

  def verify_option(option)
    return option if option.match?(/^[0-2]{1,2}$/)
    false
  end

  def player_input(size)
    loop do
      user_input = gets.chomp
      verified_option = verify_option(user_input)
      if verified_option
        return verified_option if verified_option.size == size
      end

      puts "Error, please select a valid option."
    end
  end

  def intro
    puts <<~HEREDOC
      ### Tic Tac Toe ###
      Select a option:
      1 - Player vs Player
      2 - Player vs Computer
      3 - Computer vs Computer
    HEREDOC
  end

  def display (table = Array.new(3) { Array.new(3) })
    space = "\u{0020}"
    cross = "\u{253C}"
    v_line = "\u{2500}"
    h_line = "\u{2502}"
    circle = "\u{25EF}"
    
    5.times do |i|
      line = ""
      11.times do |j|
        if i.even?
          if j == 3 || j == 7
            line += h_line
          elsif j == 1 || j == 5 || j == 9
            if table[i/2][(j - 1) / 4].nil?
              line += space
            else
              line += table[i/2][(j - 1) / 4]
            end
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
        line = (2 - i / 2).to_s + space + h_line + " " + line
      else
        line = "  " + h_line + " " + line
      end
      puts line
    end
    
    puts "  \u{2514}" + v_line + v_line + v_line + v_line + v_line + v_line + v_line + v_line + v_line + v_line + v_line + v_line + v_line
    puts "     0   1   2 "
  end
end

t = TicTacToe.new
t.display

table = Array.new(3) { Array.new(3)}
table[0][0] = 'x'

t.display(table)

puts t.verify_option("41")
puts t.verify_option("222")
puts t.verify_option("22")

t.play_game