class Player

  attr_reader :id,
              :ship_board,
              :guess_board

  def initialize(id)
    @id = id
    @ship_board = Board.new(id)
    @guess_board = Board.new(id)
  end

  def place_peg(board, status, location=[])
    peg = Peg.new(board, status, location)
  end

  def make_ship()

  end

end

  # def place_ship(bow_position, stern_position)
  #   ship board << bow, stern...
  # end
