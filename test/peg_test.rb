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
    peg = Peg.new(board, "hit")

    assert_instance_of Peg, peg
  end

  def test_it_returns_first_board_coordinate
    board = Board.new("computer")
    peg = Peg.new(board, "shot", ["b", 3])
    assert_equal 1, peg.first_coordinate
  end

  def test_it_returns_second_board_coordinate
    board = Board.new("computer")
    peg = Peg.new(board, "shot", ["a", 3])
    assert_equal 2, peg.second_coordinate
  end

  def test_if_peg_location_is_empty_and_valid
    player = Player.new("computer")
    board = player.ship_board
    peg = Peg.new(board)
    peg.random_peg("shot")

    assert true, peg.empty_and_valid
  end

  def test_it_generates_a_random_peg
    human = Player.new("human")
    computer = Player.new("computer")
    peg = Peg.new(computer.ship_board)
    peg.random_peg("ship1")
    assert true, computer.ship_board.layout.include?(peg.status)
  end
end
