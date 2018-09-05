require 'pry'
require './lib/game'
require './lib/player'
require './lib/peg'
require './lib/board'

puts "Welcome to BATTLESHIP \n
Would you like to (p)lay, read the (i)nstructions, or (q)uit? \n \n"

user_input = $stdin.gets.chomp

if user_input == "p"

  game = Game.new
  game.start
  puts game.introduction
  user_input = $stdin.gets.chomp
  game.human_player.create_human_ship(user_input, 2)
  p game.human_player.ship_ids


  #display map and prompt position.

end
