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

class ShipTest < Minitest::Test

  def test_it_exists
    ship = Ship.new("A1", "A3")

    assert_instance_of Ship, ship
  end

end
