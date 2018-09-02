require 'pry'
class Board

  attr_reader :player,
              :length,
              :width,
              :ship_layout,
              :guess_layout

  def initialize(player, length=4, width=4)
    @player = player
    @length = length
    @width = width
    @ship_layout = Array.new(length) { Array.new(width, 0) }
    @guess_layout = Array.new(length) { Array.new(width, 0) }
  end

  def print_board(layout)
     puts layout.map { |x| x.join(' ') }
  end

end
