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

class PegTest < Minitest::Test

  def test_it_exists
    board = Board.new("computer")
    peg = Peg.new(["a", 2], board)

    assert_instance_of Peg, peg
  end

  def test_it_returns_first_coordinate
    board = Board.new("computer")
    peg = Peg.new(["a", 2], board)
    assert_equal 0, peg.first_coordinate
  end

  def test_it_returns_second_coordinate
    board = Board.new("computer")
    peg = Peg.new(["b", 3], board)
    assert_equal 2, peg.second_coordinate
  end

  def test_if_coordinate_is_empty_and_valid
    board = Board.new("computer")
    peg = Peg.new(["b", 3], board)
    assert true, peg.empty_and_valid
  end

end
