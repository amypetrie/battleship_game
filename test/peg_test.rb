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

  def test_it_generates_a_random_peg
    player = Player.new("human")
    player2 = Player.new("computer")
    peg = Peg.new(player.guess_board, player2.ship_ids)
    peg.randomize_location

    assert_equal true, peg.location != ""
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

    assert_instance_of String, peg.place_valid_peg_on_board(player2)
  end

  def test_it_creates_a_computer_ship
    human = Player.new("human")
    computer = Player.new("computer")
    peg = Peg.new(computer.guess_board, computer.ship_ids)
    peg.create_computer_ship(3)
    peg.create_computer_ship(2)

    assert_equal 5, computer.ship_ids.flatten(1).length
  end

  def test_it_creates_a_specific_ship_length_3
    human = Player.new("human")
    computer = Player.new("computer")
    human.create_human_ship("A1 A3", 3)

    assert_equal 3, human.ship_ids.flatten(1).length
  end

  def test_it_creates_a_specific_ship_length_2
    human = Player.new("human")
    computer = Player.new("computer")
    human.create_human_ship("B1 B2", 2)

    assert_equal 2, human.ship_ids.flatten(1).length
  end

  def test_it_creates_a_specific_ship_length_3_varying_input
    human = Player.new("human")
    computer = Player.new("computer")
    human.create_human_ship("B4 D4", 3)

    assert_equal 3, human.ship_ids.flatten(1).length
  end

  def test_it_can_create_and_store_two_ships
    human = Player.new("human")
    computer = Player.new("computer")
    human.create_human_ship("A1 A2", 2)
    human.create_human_ship("B4 D4", 3)

    assert_equal 5, human.ship_ids.flatten(1).length
  end

  def test_randomize_ship_bow
    human = Player.new("human")
    computer = Player.new("computer")
    peg = Peg.new(computer.guess_board, computer.ship_ids)
    peg.randomize_ship_bow

    assert_equal true, peg.location != ""
  end

end
