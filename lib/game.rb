class Game

  attr_reader :status,
              :computer_player,
              :human_player

  def initialize
    @status = "not started"
    @computer_player = Player.new("computer")
    @human_player = Player.new("human")
  end

  def start
    @computer_player.make_random_ship(3)
    @computer_player.make_random_ship(2)
  end

end
