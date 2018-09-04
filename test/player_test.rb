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

class PlayerTest < Minitest::Test

  def test_it_exists
    player = Player.new("computer")

    assert_instance_of Player, player
  end

  def test_it_has_a_player_id
    player = Player.new("computer")

    assert_equal "computer", player.id
  end

  def test_it_creates_a_board
    player = Player.new("computer")

    assert_instance_of Board, player.guess_board
  end

  def test_it_has_ship_ids
    player = Player.new("computer")

    assert_equal [], player.ship_ids
  end

  def test_make_specific_guess
    player = Player.new("human")
    player2 = Player.new("computer")
    player.make_specific_guess(["a", 4], player2)

    assert_equal true, player.guess_board.layout.flatten.include?("M")
  end

  def test_make_a_random_guess
    player = Player.new("computer")
    player2 = Player.new("human")
    player.make_random_guess(player2)

    assert_equal true, player.guess_board.layout.flatten.include?("M")
  end

  def test_making_a_random_ship
    player = Player.new("computer")
    player.make_random_ship(3)
    player.make_random_ship(2)

    assert_equal 5, player.ship_ids.flatten(1).length
  end

end
