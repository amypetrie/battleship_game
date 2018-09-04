class Player

  attr_reader :id,
              :guess_board,
              :ship_ids

  def initialize(id)
    @id = id
    @guess_board = Board.new(id)
    @ship_ids = []
  end

  def place_peg(location=[], ship_ids)
    peg = Peg.new(@guess_board, location, ship_ids)
  end

  def make_ship(guess_board)

  end

end
