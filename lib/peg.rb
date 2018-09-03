class Peg

  attr_reader :board,
              :letters,
              :numbers,
              :location,
              :status

  def initialize(board, status="", location=[])
    @board = board
    @location = location
    @letters = ("a".."d").to_a
    @numbers = (1..4).to_a
    @status = status
  end

  def board_position
    @board.layout[first_coordinate][second_coordinate]
  end

  def randomize(status)
      location = [@letters.sample] + [@numbers.sample]
      @location = location
      if empty_and_valid == true
        @status = status
        place_on_board
      else
        random_peg(status)
      end
    return @status
  end

  def empty_and_valid
    if board_position == 0
      true
    elsif board_position.include?("X")
      "You got a hit!"
    else
      "You already have a peg at this location."
    end
  end

  def place_on_board
    if empty_and_valid == true
      @board.layout[first_coordinate][second_coordinate] = @status
    end
  end

  def first_coordinate
    @letters.rindex(location[0])
  end

  def second_coordinate
    @numbers.rindex(location[1])
  end

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
