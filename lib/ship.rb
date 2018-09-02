require 'pry'

class Ship

  attr_reader :bow_position,
              :stern_position,
              :letters,
              :numbers,
              :validation

  def initialize(bow_position, stern_position)
    @bow_position = bow_position
    @stern_position = stern_position
    @letters = ("a".."d").to_a
    @numbers = (1..4).to_a
    @validation = Validation.new
  end

end
