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

    # loop do until valid?

      letters = ("a".."f").to_a
      numbers = (1..6).to_a
      beginning_position = (letters.sample + numbers.sample.to_s).chars
      letter_index = letters.rindex(beginning_position[0])
      number = beginning_position[1].to_i
      binding.pry
      if ((number - size) >= 0) && ((number + size - 1) <= numbers.last)
        direction == "forward"|| "back"

        letter.rindex(letter.last) + 1 >= size - letter.rindex(beginning_position[0]) + 1 <= letters.length - size
        direction == "back" || "down" || "forward" || "up"
      elsif beginning_position[1].to_i >= size && letter.rindex(beginning_position[0])+1 >= size
        direction == "back" || "up"
      elsif beginning_position[1].to_i <= size && letter.rindex(beginning_position[0])+1 <= size
        direction == "forward" || "down"
      elsif beginning_position[1].to_i <= size && letter.rindex(beginning_position[0])+1 >= size
        direction == "forward" || "up"
      end
      direction = ["horizontal forward", "horizontal backward", "vertical up", "vertical down"].sample

    return beginning_position, end_position
  end

  def place_ship(beginning_position, end_position)
    ship = Ship.new(beginning_position, end_position)
    validation = Validate.new(ship, @ship_board)
  end

end
