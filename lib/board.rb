require 'pry'

class Board

  attr_reader :player,
              :length,
              :width,
              :layout

  def initialize(player, length=4, width=4)
    @player = player
    @length = length
    @width = width
    @layout = Array.new(length) { Array.new(width, 0) }
  end

  def current_layout
     @layout.map { |x| x.join(' ') }
  end

end
