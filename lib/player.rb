class Player

  attr_reader :id,
              :ship_board,
              :guess_board

  def initialize(id)
    @id = id
    @ship_board = Board.new(id)
    @guess_board = Board.new(id)
  end

end

  # def place_ship(bow_position, stern_position)
  #   ship board << bow, stern...
  # end
