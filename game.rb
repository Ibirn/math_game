require './players'
require './questions'

class Game

  attr_accessor :p1, :p2, :turn, :current_player

  def initialize
    @p1 = Player.new("Player 1")
    @p2 = Player.new("Player 2")
    @players = [@p1, @p2]
    @turn = 0
    @current_player = @p1
  end

  def start_round
    @question = Question.new(@turn)
    @question.ask_question(@current_player.name)
    @current_player.answer = gets.chomp.to_i
    if @current_player.answer == @question.answer
      puts "Yes! You are correct!"
      round_change
    else
      puts "Seriously? No! It's #{@question.answer}"
      @current_player.lose_life
      round_change
    end
  end

  def round_change
    puts "P1: #{@p1.lives}/3 vs P2: #{@p2.lives}/3"
    game_over?
    puts "----- NEW TURN -----"
    toggle_turn
    start_round
  end

  def toggle_turn
    @turn += 1
    @current_player = @players[@turn % 2]
  end
  
  def game_over?
    if @current_player.lives == 0
      toggle_turn
      puts "#{@current_player.name} wins with a score of #{@current_player.lives} in #{@turn} turns!"
      puts "----- GAME OVER -----"
      exit(0)
    end
  end
end