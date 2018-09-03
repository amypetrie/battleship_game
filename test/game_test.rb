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

class GameTest < Minitest::Test

  def test_it_exists
    game = Game.new

    assert_instance_of Game, game
  end

  def test_it_has_a_not_started_status_when_created
    game = Game.new

    assert_equal "not started", game.status
  end

  def test_it_creates_new_computer_player_object_when_created
    game = Game.new

    assert_instance_of Player, game.computer_player
  end

end
