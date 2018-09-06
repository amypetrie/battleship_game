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

  def randomize_location(opponent, player)
    loop do
      location = [@letters.sample] + [@numbers.sample]
      @location = location
    break if space_is_valid(opponent, player) == true
      randomize_location(opponent, player)
    end
  end

  def space_is_valid(opponent, player)
    if board_position == 0
      true
    elsif opponent.id == "computer"
      p "You already have a peg at this location, try again:"
      puts "\n"
      user_input = $stdin.gets.chomp.downcase.chars
      puts "\n"
      user_input[1] = user_input[1].to_i
      @location = user_input
      place_valid_peg_on_board(opponent, player)
    end
  end

  def randomize_ship_bow
    loop do
      location = [@letters.sample] + [@numbers.sample]
      @location = location
    break if ship_coordinate_is_invalid == false
      randomize_ship_bow
    end
    return location
  end

  def ship_coordinate_is_invalid
    if @ship_ids.include?(location)
      true
    else
      false
    end
  end

  # def check_for_sunk_ship(opponent)
  #   opponent.ship_ids.each do |ship_array|
  #     if ship_array.length.include?(location)
  #       p "You got a hit!"
  #       opponent.ship_ids.delete(location)
  #       p "You sunk a ship!"
  #       opponent.ship_ids.delete(ship_array)
  #     else
  #     end
  #   end
  # end

  def hit_message(opponent)
    p "A hit at #{location} against #{opponent.id}!"
  end

  def miss_message(opponent)
    p "A miss at #{location} against #{opponent.id}."
  end

  def place_valid_peg_on_board(opponent, player)
    if space_is_valid(opponent, player) == true
      if opponent.ship_ids.flatten(1).include?(location)
        @board.layout[first_coordinate][second_coordinate] = "H"
        hit_message(opponent)
        else
        @board.layout[first_coordinate][second_coordinate] = "M"
        miss_message(opponent)
      end
    else
    end
  end

  def specific_ship(size, stern)
    letter_index = letters.rindex(location[0])
    number = location[1]
    middle = []
    stern_position = []
    if size < 3 && ship_coordinate_is_invalid == false && (@ship_ids.include?(stern)== false)
      @ship_ids << [stern] + [location]
    elsif ship_coordinate_is_invalid == false && (@ship_ids.include?(stern)== false)
      if stern[1] == number && (letters.rindex(location[0]) > letters.rindex(stern[0]))
        @ship_ids << [location] + [stern] + [[letters[letter_index - 1], location[1]]]
      elsif stern[1] == number && (letters.rindex(location[0]) < letters.rindex(stern[0]))
        @ship_ids << [location] + [stern] + [[letters[letter_index + 1], location[1]]]
      elsif (stern[0] == location[0]) && (stern[1] > location[1])
        @ship_ids << [location] + [stern] + [[stern[0], stern[1] - location[1]]]
      elsif (stern[0] == location[0]) && (stern[1] < location[1])
        @ship_ids << [location] + [stern] + [[stern[0], location[1] - stern[1]]]
      end
    end
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

    middle = []
    stern_position = []

    loop do
      direction = direction_options.sample

      if direction == "forward"
        stern_position << [(location[0]), number + size - 1]
      elsif direction == "backward"
        stern_position << [(location[0]), number - size + 1]
      elsif direction == "up"
        stern_position << [(letters[letter_index - size + 1]), number]
      elsif direction == "down"
        stern_position << [(letters[letter_index + size - 1]), number]
      end

      if size > 2
        if direction == "forward"
          middle << [(location[0]), number + size - 2]
        elsif direction == "backward"
          middle << [(location[0]), number - size + 2]
        elsif direction == "up"
          middle << [(letters[letter_index - size + 2]), number]
        elsif direction == "down"
          middle << [(letters[letter_index + size - 2]), number]
        end
      else middle = nil
      end

    break if (@ship_ids.include?(middle) == false) && (@ship_ids.include?(stern_position) == false)
    end

      @ship_ids << [location] + [middle] + [stern_position]

      @ship_ids.map do |array|
      array.compact!
      end

  end

end
