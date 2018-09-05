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

  def test_start_creates_two_random_computer_ships
    game = Game.new
    game.start

    assert_equal 2, game.computer_player.ship_ids.count
  end

  def test_it_contains_the_introduction
    game = Game.new

    assert_instance_of String, game.introduction
  end

  def test_it_contains_prompt_for_second_ship
    game = Game.new

    assert_instance_of String, game.prompt_for_second_ship
  end

end
