require './Player.rb'
require './Turn.rb'
require './Question.rb'

class Game
  attr_accessor :players

  def initialize
    @players = [
      Player.new("p1"),
      Player.new("p2")
    ]
    @turn = Turn.new(@players)
  end

  def run
    while (not game_over?) do
      @turn.next_turn
      puts
      puts "------ NEW TURN ------"
      puts
      puts "#{@turn.current_player.name}:"
      q = Question.new()
      puts q.create_question()
      guess = $stdin.gets.chomp 
      if q.check(guess.to_i)
        puts 
        puts "****** CORRECT ANSWER, #{@turn.current_player.name} ******"
      else
        puts "------ WRONG ANSWER, #{@turn.current_player.name} ------"
        @turn.current_player.life_lost()
      end
      puts 
      puts "------ SUMMARY ------"
      puts 
      @players.each do |p|
        puts score_summary(p)
      end
    end
  end

  def game_over?
    @players.each do |p| 
      if p.health == 0
        puts "------ GAME OVER ------"
        return true
      end
    end 
    return false
  end

  def score_summary player
    "#{player.name}: #{player.health}"
  end
end