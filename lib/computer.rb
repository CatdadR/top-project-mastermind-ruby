
class Computer
  
  @@code = [].to_s
  @@colors = ["red", "blue", "green", "yellow", "magenta", "cyan"]

  def the_mastermind
    
  end

  def generate_code 
    @@code = [@@colors.sample, @@colors.sample, @@colors.sample ,@@colors.sample, @@colors.sample]
    puts @@code
  end

  def feedback(player_guess, display)
    @@correct = 0
    @wrong = 0  
    @difference = (player_guess - @@code)
    @@code.length.times do |i|
      if @@code[i] == player_guess[i]
        @@correct += 1
      else 
        @wrong += 1
      end
    end
    @difference = (@wrong - @difference.length) + (@wrong + @@correct) - 5
    display.display_feedback(@@correct, @difference)
  end

  def correct
    return @@correct
  end
end
