class Peg

  attr_reader :location,
              :board

  def initialize(location, board)
    @location = location
    @board = board
    @letters = ("a".."d").to_a
    @numbers = (1..4).to_a
  end

  def is_valid?
    @board.layout[first_coordinate][second_coordinate] == 0
  end

  def first_coordinate
    letters.rindex(location[0])
  end

  def second_coordinate
    number.rindex(location[1])
  end

end
