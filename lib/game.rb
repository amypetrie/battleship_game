class Game

  attr_reader :status,
              :computer_player

  def initialize
    @status = "not started"
    @computer_player = Player.new("computer")
  end

  def start

  end

  def create_bow_peg
    # loop do until bow_peg.validate?
    letters = ("a".."d").to_a
    numbers = (1..4).to_a
    bow_position = [letters.sample] + [numbers.sample]
    bow_peg = Peg.new(bow_position, @computer_player.guess_board)
    binding.pry
  end

  #   letter_index = letters.rindex(bow_position[0])
  #   number = bow_position[1]
  #   direction_options = []
  #
  #     if (number + size - 1) <= numbers.last && ((number - size + 1) >= numbers.first)
  #       direction_options << ["forward", "backward"].sample
  #     elsif (number + size - 1) <= numbers.last
  #       direction_options << "forward"
  #     elsif ((number - size + 1) >= numbers.first)
  #       direction_options << "backward"
  #     end
  #
  #     if (letter_index - size + 1) >= letters.rindex(letters.first) && (letter_index + size - 1) <= letters.rindex(letters.last)
  #       direction_options << ["up", "down"].sample
  #     elsif(letter_index - size + 1) >= letters.rindex(letters.first)
  #       direction_options << "up"
  #     elsif (letter_index + size - 1) <= letters.rindex(letters.last)
  #       direction_options << "down"
  #     end
  #
  #     direction = direction_options.sample
  #
  #     if direction == "forward"
  #       stern_position = [(bow_position[0]), number + size - 1]
  #     elsif direction == "backward"
  #       stern_position = [(bow_position[0]), number - size + 1]
  #     elsif direction == "up"
  #       stern_position = [(letters[letter_index - size + 1]), number]
  #     elsif direction == "down"
  #       stern_position = [(letters[letter_index + size - 1]), number]
  #     end
  #
  #   return bow_position + stern_position
  #
  # end

end
