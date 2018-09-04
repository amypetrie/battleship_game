class Game

  attr_reader :status,
              :computer_player

  def initialize
    @status = "not started"
    @computer_player = Player.new("computer")
  end

  def start
    @computer_player.make_random_ship(3)
    @computer_player.make_random_ship(2)
    human = Player.new("human")
  end

end
