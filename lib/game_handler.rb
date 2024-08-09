require_relative 'player'
require_relative 'display'
require_relative 'computer'
require 'rainbow/refinement'
using Rainbow



class GameHandler
  
  @@board_array = Array.new(61, "o")
  @@round = 1

  def initialize
    self.start_menu  
    self.game_mode
  end

  def start_menu
    @player = Player.new
    @display = Display.new 
    @computer = Computer.new
  end

  def game_mode
    @game_mode = gets.chomp
    if @game_mode == '1'
      code_breaker_begin        
      else if @game_mode == '2'
        mastermind_begin        
      end         
    end  
  end

  def code_breaker_begin
      if @@round == 1
        @computer.generate_code 
        @display.display_board(@@board_array)
      end
      guess_checker(@player.make_guess(@round))
      @display.display_board(@@board_array)
      @@round += 1
      code_breaker_begin
  end

  def mastermind_begin
  
  end

  def guess_checker(guess)
      @computer.feedback(guess, @display)
      @count = ((@@round - 1) * 5)
    guess.each do |color|
      @count += 1
      case color 
      when color = "red" 
        @@board_array[@count] = @@board_array[@count].to_s.red  
      when color = "blue" 
        @@board_array[@count] = @@board_array[@count].to_s.blue
      when color = "green" 
        @@board_array[@count] = @@board_array[@count].to_s.green
      when color = "yellow" 
        @@board_array[@count] = @@board_array[@count].to_s.yellow
      when color = "magenta" 
        @@board_array[@count] = @@board_array[@count].to_s.magenta 
      when color = "cyan" 
        @@board_array[@count] = @@board_array[@count].to_s.cyan 
      else
        puts "input is not vaild please try again" 
      end 
    end
    if @computer.correct == 5
      game_end('codebreaker')
      else if @@round == 12
        puts 'codebreaker lost'
        exit 
      end 
    end
  end

  def game_end(winner)
    puts "#{winner} won in #{@@round} rounds"
    exit 
  end
end