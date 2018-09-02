require 'pry'
require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require './lib/game'
require './lib/player'
require './lib/board'

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

  def test_it_creates_nested_array_for_ship_and_guess_boards
    board = Board.new("computer")
    expected = [ [0,0,0,0], [0,0,0,0], [0,0,0,0], [0,0,0,0] ]

    assert_equal expected, board.ship_layout
    assert_equal expected, board.guess_layout
  end

  def test_it_creates_the_ship_and_guess_board_arrays_using_provided_dimensions
    board = Board.new("computer", 3, 3)
    expected = [ [0,0,0], [0,0,0], [0,0,0] ]

    assert_equal expected, board.ship_layout
    assert_equal expected, board.guess_layout
  end

  def test_printing_out_the_board
    skip
    board = Board.new("computer")
    board.print_board(board.ship_layout)
  end
  
end
