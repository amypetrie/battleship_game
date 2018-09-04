require 'pry'
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

  def randomize_ship_bow
    loop do
      location = [@letters.sample] + [@numbers.sample]
      @location = location
    break if ship_coordinate_is_valid == false
      randomize_ship_bow
    end
    return location
  end

  def ship_coordinate_is_valid
    if @ship_ids.include?(location)
      true
    else
      false
    end
  end

  def check_for_sunk_ship(opponent)
    if opponent.ship_ids.each do |ship_array|
      if ship_array.length.include?(location)
        ship_array.delete(location)

        p "You sunk a ship!"
        opponent.ship_ids.delete(ship_array)
      else
      end
    else

  def place_valid_peg_on_board(opponent)
    space_is_valid
      if space_is_valid == true
        if opponent.ship_ids.flatten(1).include?(location)
          board_position = "H"
          p "You got a hit!"
          check_for_sunk_ship(opponent)
        else
          board_position = "M"
          p "You missed."
        end
      else
      end
    @board.layout
  end

  def create_computer_ship(size)
    randomize_ship_bow
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

    if size > 2
      if direction == "forward"
        middle = [(location[0]), number + size - 2]
      elsif direction == "backward"
        middle = [(location[0]), number - size + 2]
      elsif direction == "up"
        middle = [(letters[letter_index - size + 2]), number]
      elsif direction == "down"
        middle = [(letters[letter_index + size - 2]), number]
      end
    end

    @ship_ids << [location] + [middle] + [stern_position]
    @ship_ids.map do |array|
      array.compact!
    end

  end

end
