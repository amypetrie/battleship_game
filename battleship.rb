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
  puts "I have laid out my ships on the grid.
  You now need to layout your two ships.
  The first is two units long and the
  second is three units long.
  The grid has A1 at the top left and D4 at the bottom right.
  \n
  Enter the squares for the two-unit ship: "
  user_input = $stdin.gets.chomp
end
