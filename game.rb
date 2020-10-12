require './players'
require './questions'

class Game

  attr_accessor :p1, :p2, :turn

  def initialize
    @p1 = Player.new("Player 1")
    @p2 = Player.new("Player 2")
    @players = [@p1, @p2]
    @turn = 0
    turn
  end

  def turn
    @question = Question.new
    @question.ask_question(@players[@turn].name)
    @players[@turn].answer = gets.chomp.to_i
    if @players[@turn].answer == @question.answer
      puts "Yes! You are correct!"
      round_change
    else
      puts "Seriously? No!"
      @players[@turn].lose_life
      round_change
    end
  end

  def round_change
    puts "P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3"
    game_over?
    puts "----- NEW TURN -----"
    toggle_turn
    turn
  end

  def toggle_turn
    @turn = (@turn + 1) % 2
  end
  
  def game_over?
    if @players[@turn].lives == 0
      toggle_turn
      puts "#{@players[@turn].name} wins with a score of #{@players[@turn].lives}!"
      puts "----- GAME OVER -----"
      exit(0)
    end
  end
end