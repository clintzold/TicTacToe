#Game Board

class Board
  #class variable array that aids in checking and marking board cells
  @@choices = ['', [:top, 0], [:top,1], [:top,2], [:middle,0], [:middle,1], [:middle,2], [:bottom,0], [:bottom,1], [:bottom,2]]

  #Gives access to read and change game-board hash table
  attr_accessor :board

  def initialize
    @board = {  :top => ['%','%','%'], :middle => ['%','%','%'], :bottom => ['%','%','%'] }
  end
  #Loads an example board with numbers to display cell choices
  def example
    self.board = { :top => ['1','2','3'], :middle => ['4','5','6'], :bottom => ['7','8','9']}
  end
#Prints up-to-date playing board to terminal
  def print_board
    puts "\n          | BOARD |"
    self.board.each do |key, value|
      puts "          | #{value[0]} #{value[1]} #{value[2]} |\n"
    end
    puts "          \u203E\u203E\u203E\u203E\u203E\u203E\u203E\u203E\u203E\n"
  end
  #Prints gameplay title and board
  def print_gameplay(name_one, score_one, name_two, score_two)
    puts "\n\n%%%%%%%%%%%_GAMEPLAY_%%%%%%%%%%%%\n"
    self.print_board
    print "#{name_one}'s Score:#{score_one}     #{name_two}'s Score:#{score_two}\n"
  end
 #Changes cell to players marker if check_cell passes 
  def update_cell(choice, mark)
    row = @@choices[choice][0]
    column = @@choices[choice][1]
    self.board[row][column] = mark
  end
  #Checks if cell is already marked **Create Loop in MAIN** 
  def check_cell(choice, mark)
    row = @@choices[choice][0]
    column = @@choices[choice][1]
      if self.board[row][column] != '%'
        puts "#{choice.to_s} is already marked! Choose another!"
      else
        self.update_cell(choice, mark)
      end
  end

end
