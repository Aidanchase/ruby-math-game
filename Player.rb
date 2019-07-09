class Player
  attr_reader :name
  attr_accessor :health

  STARTING_HEALTH = 3

  def initialize(name)
    @name = name
    @health = STARTING_HEALTH
  end

  def life_lost
    @health -= 1
  end

  def dead?
    @health <= 0
  end
end

