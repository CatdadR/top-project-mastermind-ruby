require 'rainbow/refinement'
using Rainbow

class Display 
  
  def initialize
    self.display_menu 
  end

  def display_menu
    puts "Are you a Code breaker or a Mastermind?"
    puts "1. Code Breaker"
    puts "2. Mastermind"
  end

  def display_board(current_board)
    @rows = (current_board.length / 5) - 1
    @rows.downto(0) do |row|
      puts ["[ #{current_board[(1 + (row * 5))]} #{current_board[(2 + (row * 5))]} #{current_board[(3 + (row * 5))]} #{current_board[(4 + (row * 5))]} #{current_board[(5 + (row * 5))]} ]"]
    end
  end

  def display_feedback(black, white)
    @feedback_array = %w[o o o o o]
    @random = [0,1,2,3,4].shuffle 
    black.times do |n|
      @feedback_array[n] = @feedback_array[n].to_s.red
    end
    white.times do |n|
      @feedback_array[n + black] = @feedback_array[n + black].to_s.blue
    end
    puts "#{@feedback_array[@random[0]]}" + "   " + "#{@feedback_array[@random[1]]}"
    puts "  " + "#{@feedback_array[@random[2]]}" + "  " 
    puts "#{@feedback_array[@random[3]]}" + "   " + "#{@feedback_array[@random[4]]}"
  end
end