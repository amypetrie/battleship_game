class Game

  attr_reader :status

  def initialize
    @status = "not started"
  end

  def start
    computer_player = Player.new("computer")
    computer_board = Board.new("computer")
  end

end
