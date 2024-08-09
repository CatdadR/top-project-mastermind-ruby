class Player

  def initialize 
    self.name 
  end

  def name
    @name = gets
    puts "Hello #{@name}"
  end

  def make_guess(round)
    @guess = gets.downcase.split
    if @guess.length > 5
      puts "Too many colors pick again"
      make_guess(round)
    end
    return @guess
  end
end