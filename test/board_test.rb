require 'pry'
require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/player'
require './lib/board'
require './lib/ship'
require './lib/peg'
require './lib/validate'

class BoardTest < Minitest::Test

  def test_it_exists
    board = Board.new("human")

    assert_instance_of Board, board
  end

  def test_it_has_default_width_default_length_and_custom_player_attributes
    board = Board.new("computer")

    assert_equal 4, board.length
    assert_equal 4, board.width
    assert_equal "computer", board.player
  end

  def test_it_creates_a_default_nested_array_layout
    board = Board.new("computer")
    expected = [ [0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0] ]

    assert_equal expected, board.layout
  end

end
