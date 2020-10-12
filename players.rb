class Player

  attr_accessor :name, :lives, :answer

  def initialize(name)
    @name = name
    @lives = 3
    @answer = ""
  end

  def lose_life
    @lives -= 1
  end

end