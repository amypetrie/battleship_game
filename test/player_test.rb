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

  def test_it_generates_coordinates
    player = Player.new("computer")

    assert_equal "", player.generate_ship_coordinates(3)
  end
end
