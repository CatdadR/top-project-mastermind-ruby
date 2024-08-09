require_relative 'lib/game_handler'

def master_mind
  puts "Welcome to Mastermind"
  puts "Please enter your name"
  GameHandler.new
end

master_mind