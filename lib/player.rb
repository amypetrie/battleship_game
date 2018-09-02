class Player

  attr_reader :id,
              :ship_board,
              :guess_board

  def initialize(id)
    @id = id
    @ship_board = Board.new(id)
    @guess_board = Board.new(id)
  end

  def generate_ship_coordinates(size)

    loop do until valid?

      letter = ("a".."d").to_a
      number = (1..4).to_a
      beginning_position = (letter.sample + number.sample).chars


      direction = ["horizontal", "vertical"].sample
      end_position = beginning_position

    validate(beginning_position, end_position)
    return beginning_position, end_position
  end

  def place_ship(beginning_position, end_position)
    ship = Ship.new(beginning_position, end_position)
    validation = Validate.new(ship, @ship_board)
  end

end
