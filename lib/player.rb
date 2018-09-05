class Player

  attr_reader :id,
              :guess_board,
              :ship_ids

  def initialize(id)
    @id = id
    @guess_board = Board.new(id)
    @ship_ids = []
  end

  def make_specific_guess(location, opponent)
    peg = Peg.new(@guess_board, @ship_ids, location)
    peg.space_is_valid
    peg.place_valid_peg_on_board(opponent)
  end

  def make_specific_ship(size, bow, stern)
    peg = Peg.new(@guess_board, @ship_ids, location=bow)
    peg.create_specific_ship(size, stern)

  end

  def make_random_guess(opponent)
    peg = Peg.new(@guess_board, @ship_ids)
    peg.randomize_location
    peg.place_valid_peg_on_board(opponent)
  end

  def make_random_ship(size)
    peg = Peg.new(@guess_board, @ship_ids)
    peg.create_computer_ship(size)
  end

end
