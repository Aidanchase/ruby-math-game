class Turn
  attr_reader :current_player

  def initialize players
    @players = players
    @current_index = 0;
  end

  def next_turn
    @current_player = @players[@current_index]
    @current_index = (@current_index + 1) % @players.count
  end
end