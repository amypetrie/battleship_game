require 'pry'

class Ship

  attr_reader :beginning_position,
              :end_position

  def initialize(beginning_position, end_position)
    @beginning_position = beginning_position
    @end_position = end_position
  end

end
