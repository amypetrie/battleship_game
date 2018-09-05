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

  def introduction
    "I have laid out my ships on the grid.
    You now need to layout your two ships.
    The first is two units long and the
    second is three units long.
    The grid has A1 at the top left and D4 at the bottom right.
    \n
    Enter the squares for the two-unit ship: "
  end

  def prompt_for_second_ship
    "Enter the beginning and end coordinate for the three-unit ship: "
  end

  def display_map(player)
    player.guess_board.current_layout
  end
end
