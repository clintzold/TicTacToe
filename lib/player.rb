#Players and methods concerning their attributes live here
class Players
  @@choices = [1,2,3,4,5,6,7,8,9]
  attr_accessor :name, :turn, :score, :marker
  def initialize(marker)
    @name = 'Player' 
    @turn = false
    @score = 0
    @marker = marker
  end

  def set_name
    name = gets.chomp.capitalize
    self.name = name
  end

  def greeting
    puts "\nGreetings, #{self.name}!"
  end
  #Ensures proper cell selection
  def make_choice
    print "#{self.name}, please choose a cell: "
    loop do
     choice = gets.chomp.to_i
     if @@choices.any? {|num| num == choice}
      return choice
     else 
       puts "Invalid choice. Select a number from 1 - 9"
     end
    end
  end
  #Announces winner
  def wins
    puts "#{self.name} wins!!!!!"
  end


end
