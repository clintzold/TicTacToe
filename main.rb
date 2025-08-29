require 'pry-byebug'
require_relative 'lib/player'
require_relative 'lib/board'

player_one = Players.new('X')
binding.pry
player_two = Players.new('O')

puts "Enter a name for Player One"
player_one.set_name
player_one.greeting
puts "\nEnter a name for Player Two"
binding.pry
player_two.set_name
player_two.greeting
