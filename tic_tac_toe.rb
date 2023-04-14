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

  def initialize(player = 'x', table = Array.new(3) { Array.new(3) })
    @player = player
    @table = table
  end

  def play_game
    intro
    mode = player_input(1)
    game(mode)
  end

  def game(mode)
    if mode == '0'
      pvp_game
    end
    puts "Sorry, mode not implemented yet."
  end


  def pvp_game
    puts '-------------------------------------'
    display
    loop do
      puts "Player's #{@player}  turn"
      puts "Select a position:"
      x, y = player_input(2)
      if @player == 'x'        
        @table[x][y] = "\e[31m#{@player}\e[0m"
      else
        @table[x][y] = "\e[34m#{@player}\e[0m"
      end
      display()

      @player = @player == 'x' ? "\u{25EF}" : 'x'
      return if check_game
      
    end
  end

  def check_game
    return true if @table.flatten.none? { |e| e.nil? }

    
    false
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
        if verified_option.size == size && size == 2          
          position = verified_option.split("")
          x = 2 - position[1].to_i
          y = position[0].to_i 
          return x, y if @table[x][y].nil?
        elsif verified_option.size == size && size == 1
          return verified_option
        end
      end

      puts "Error, please select a valid option."
    end
  end

  def intro
    puts <<~HEREDOC
      ### Tic Tac Toe ###
      Select a option:
      0 - Player vs Player
      1 - Player vs Computer
      2 - Computer vs Computer
    HEREDOC
  end

  def display ()
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
            if @table[i/2][(j - 1) / 4].nil?
              line += space
            else
              line += @table[i/2][(j - 1) / 4]
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

t.play_game