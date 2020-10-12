class Question

  attr_accessor :answer

  def initialize
    @num1 = rand(20)
    @num2 = rand(20)
    @answer = @num1 + @num2
  end

  def ask_question(player)
    p "#{player}: What is #{@num1} + #{@num2}?"
  end
  
end