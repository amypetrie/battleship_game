class Player

  attr_reader :id,
              :guess_board,
              :ship_ids

  def initialize(id)
    @id = id
    @guess_board = Board.new(id)
    @ship_ids = []
  end

  def make_specific_guess(user_input, opponent)
    location = user_input.downcase.chars
    location[1] = location[1].to_i
    peg = Peg.new(@guess_board, @ship_ids, location)
    peg.space_is_valid
    peg.place_valid_peg_on_board(opponent)
  end

  def create_human_ship(user_input, size)
    bow = user_input.downcase.chars[0..1]
    bow[1] = bow[1].to_i
    stern = user_input.downcase.chars[3..4]
    stern[1] = stern[1].to_i
    peg = Peg.new(@guess_board, @ship_ids, location=bow)
    peg.specific_ship(size, stern)
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
