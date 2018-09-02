class Game

  attr_reader :status,
              :computer_player

  def initialize
    @status = "not started"
    @computer_player = Player.new("computer")
  end

  def start
    # comp_ship_1 = computer_player.place_ship(generate_ship_coordinates(size))
    # comp_ship_2 = computer_player.place_ship_2(generate_ship_coordinates)
    #prompt user for their coordinates
  end

end
