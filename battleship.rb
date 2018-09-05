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

bow = user_input.downcase.chars[0..1]
bow[1] = bow[1].to_i
stern = user_input.downcase.chars[3..4]
stern[4] = stern[4].to_i

ship = game.human_player.make_specific_ship(2, bow, stern)
