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
    puts "#{@turn}"
    @question = Question.new
    @question.ask_question(@players[@turn].name)
    @players[@turn].answer = gets.chomp.to_i
    if @players[@turn].answer == @question.answer
      puts "Yes! You are correct!"
    else
      puts "Seriously? No!"
      @players[@turn].lose_life
    end
  end

end