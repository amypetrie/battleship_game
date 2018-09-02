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
    peg = Peg.new(["a", 2])

    assert_instance_of Peg, peg
  end

  def test_is_valid
  end
end
