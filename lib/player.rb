#Players and methods concerning their attributes live here
class Players
  attr_accessor :name, :turn, :score, :marker
  def initialize(marker)
    @name = 'Player' 
    @turn = false
    @score = 0
    @marker =''
  end

  def set_name
    name = gets.chomp.capitalize
    self.name = name
  end

  def greeting
    puts "\nGreetings, #{self.name}!"
  end

end
