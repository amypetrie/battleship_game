require 'pry'
require './lib/game'
require './lib/player'
require './lib/peg'
require './lib/board'

puts "Welcome to BATTLESHIP \n
Would you like to (p)lay, read the (i)nstructions, or (q)uit? \n \n"

user_input = $stdin.gets.chomp
puts "\n"
if user_input == "p"

  game = Game.new
  game.start
  puts game.introduction
  puts "\n"
  user_input = $stdin.gets.chomp
  puts "\n"
  game.human_player.create_human_ship(user_input, 2)
  puts "\n"
  puts game.prompt_for_second_ship
  puts "\n"
  user_input = $stdin.gets.chomp
  puts "\n"
  game.human_player.create_human_ship(user_input, 3)
  puts "\n"
  puts "For reference during testing, the computer ships are located at: "
  puts "\n"
  p game.computer_player.ship_ids.flatten(1)

loop do
  puts "\n"
  puts game.display_map(game.human_player)
  puts "\n"
  puts game.prompt_for_guess
  puts "\n"
  user_input = $stdin.gets.chomp
  puts "\n"
  game.human_player.make_specific_guess(user_input, game.computer_player)
  puts "\n"
  puts game.display_map(game.human_player)
  puts "\n"
  puts "The computer will now make a guess."
  puts "\n"
  game.computer_player.make_random_guess(game.human_player)
  puts "\n"
  puts "This is the computer's board."
  puts "\n"
  puts game.display_map(game.computer_player)
  puts "\n"
end

end
