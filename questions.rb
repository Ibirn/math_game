class Question

  attr_accessor :answer

  def initialize(difficulty)
    @num1 = rand(20)
    @num2 = rand(20)
    @difficulty = difficulty
  end

  def ask_question(player)
    if @difficulty < 5
      @answer = @num1 + @num2
      puts "#{player}: What is #{@num1} + #{@num2}?"
    elsif @difficulty < 10
      @answer = @num1 - @num2
      puts "#{player}: What is #{@num1} - #{@num2}?"
    elsif @difficulty < 15
      @answer = @num1 * @num2
      puts "#{player}: What is #{@num1} * #{@num2}?"
    else
      @num1 = rand(10)
      @num2 = rand(10)
      @num3 = rand(20)
      @answer = @num1 * (@num2 / @num3)
      puts "#{player}: What is #{@num1} * (#{@num2} + #{@num3})?"
    end
  end
  
end