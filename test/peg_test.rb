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
    player = Player.new("human")
    player2 = Player.new("computer")
    peg = Peg.new(player.guess_board, player2.ship_ids, ["a", 2])

    assert_instance_of Peg, peg
  end

  def test_it_returns_first_board_coordinate
    player = Player.new("human")
    player2 = Player.new("computer")
    peg = Peg.new(player.guess_board, player2.ship_ids, ["a", 2])

    assert_equal 0, peg.first_coordinate
  end

  def test_it_returns_item_at_board_location
    player = Player.new("human")
    player2 = Player.new("computer")
    peg = Peg.new(player.guess_board, player2.ship_ids, ["a", 2])

    assert_equal 0, peg.board_position
  end

  def test_it_returns_second_board_coordinate
    player = Player.new("human")
    player2 = Player.new("computer")
    peg = Peg.new(player.guess_board, player2.ship_ids, ["a", 2])

    assert_equal 1, peg.second_coordinate
  end

  def test_if_peg_location_is_valid
    player = Player.new("human")
    player2 = Player.new("computer")
    peg = Peg.new(player.guess_board, player2.ship_ids, ["a", 2])

    assert true, peg.space_is_valid
  end

  def test_placing_valid_peg_on_board_as_miss
    player = Player.new("human")
    player2 = Player.new("computer")
    peg = Peg.new(player.guess_board, player2.ship_ids, ["a", 2])
    peg.place_valid_peg_on_board

    assert_equal true, player.guess_board.layout.flatten.include?("M")
  end

  def test_it_generates_a_random_peg
    player = Player.new("human")
    player2 = Player.new("computer")
    peg = Peg.new(player.guess_board, player2.ship_ids)
    peg.randomize_location

    assert_equal "", peg.location
  end
end
#   def test_it_creates_a_ship
#     human = Player.new("human")
#     computer = Player.new("computer")
#     peg = Peg.new(computer.ship_board, "cs13")
#
#     assert_equal "", peg.create_ship(3)
#   end
# end
