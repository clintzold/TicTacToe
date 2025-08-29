require 'pry-byebug'
require_relative 'lib/player'
require_relative 'lib/board'
#Initialize players
player_one = Players.new('X')
player_two = Players.new('O')
#Initialize game-board's
example_board = Board.new
example_board.example
game_board = Board.new
#Pre-game welcome and player setup
puts "\n\n%%%%%%%%%%%%%%%_WELCOME TO CLINT'S TIC-TAC-TOE_%%%%%%%%%%%%%%%%\n\n"
print "\nEnter a name for Player One: "
player_one.set_name
player_one.greeting
print "\nEnter a name for Player Two: "
player_two.set_name
player_two.greeting
#List rules
puts "\n\n%%%%%%%%%%%_RULES_%%%%%%%%%%%%\n"
example_board.print
print "Okay, above is an example board.\nThe board consists of 9 cells.\nEach cell is selected by entering a number(1 - 9).\n\nGood luck, #{player_one.name} and #{player_two.name}!\n\n Press <Enter> to begin..."
gets
