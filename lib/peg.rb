class Peg

  attr_reader :board,
              :location,
              :ship_ids,
              :letters,
              :numbers,
              :status

  def initialize(board, ship_ids, location=[])
    @board = board
    @location = location
    @letters = ("a".."d").to_a
    @numbers = (1..4).to_a
    @ship_ids = ship_ids
    @status = ""
  end

  def first_coordinate
    @letters.rindex(location[0])
  end

  def second_coordinate
    @numbers.rindex(location[1])
  end

  def board_position
    @board.layout[first_coordinate][second_coordinate]
  end

  def randomize_location
    loop do
      location = [@letters.sample] + [@numbers.sample]
      @location = location
    break if space_is_valid == true
      randomize_location
    end
  end

  def space_is_valid
    if board_position == 0
      true
    else
      "You already have a peg at this location."
    end
  end
  #
  # def place_miss_on_board
  #   @board.position = "miss"
  # end
  #
  # def place_hit_on_board
  #   @board.position = "hit"
  # end

  def create_ship(size)
    randomize(@status)
    letter_index = letters.rindex(location[0])
    number = location[1]
    direction_options = []

    if (number + size - 1) <= numbers.last && ((number - size + 1) >= numbers.first)
      direction_options << ["forward", "backward"].sample
    elsif (number + size - 1) <= numbers.last
      direction_options << "forward"
    elsif ((number - size + 1) >= numbers.first)
      direction_options << "backward"
    end

    if (letter_index - size + 1) >= letters.rindex(letters.first) && (letter_index + size - 1) <= letters.rindex(letters.last)
      direction_options << ["up", "down"].sample
    elsif(letter_index - size + 1) >= letters.rindex(letters.first)
      direction_options << "up"
    elsif (letter_index + size - 1) <= letters.rindex(letters.last)
      direction_options << "down"
    end

    direction = direction_options.sample

    if direction == "forward"
      stern_position = [(location[0]), number + size - 1]
    elsif direction == "backward"
      stern_position = [(location[0]), number - size + 1]
    elsif direction == "up"
      stern_position = [(letters[letter_index - size + 1]), number]
    elsif direction == "down"
      stern_position = [(letters[letter_index + size - 1]), number]
    end

    return stern_position
  end

end
