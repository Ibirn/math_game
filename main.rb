require './game.rb'
run_game = Game.new
puts "Welcome to the Number Game!"
puts "Players take turns solving math problems."
puts "If you get one wrong, you lose a life."
puts "When one player loses all three of their lives, the game is over."
puts "Are you ready to play?"
gets.chomp
run_game.start_round
