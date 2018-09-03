class Peg

  attr_reader :location,
              :board,
              :letters,
              :numbers

  def initialize(location, board)
    @location = location
    @board = board
    @letters = ("a".."d").to_a
    @numbers = (1..4).to_a
  end

  def empty_and_valid
    @board.layout[first_coordinate][second_coordinate] == 0
  end

  def first_coordinate
    @letters.rindex(location[0])
  end

  def second_coordinate
    @numbers.rindex(location[1])
  end

end
