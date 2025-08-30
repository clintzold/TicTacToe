#Game Board

class Board
  #class variable array that aids in checking and marking board cells
  @@choices = ['', [:top, 0], [:top,1], [:top,2], [:middle,0], [:middle,1], [:middle,2], [:bottom,0], [:bottom,1], [:bottom,2]]

  #Gives access to read and change game-board hash table
  attr_accessor :board
  #Initialize new boards
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
  #Checks for draw
  def check_draw
    self.board.each do |row, value|
      if value.any? {|char| char == '%'}
        return false
      else
        next
      end
    end
    return true
  end
  #Checks rows for matching markers
  def check_win_rows
    self.board.each do |row, value|
      characters = [value[0], value[1], value[2]]
      if characters.all? {|char| char == characters.first && char != '%'}
        return value[0]#returns winning marker
      else
        next
      end
    end
    return false#no row win
  end
  #Checks columns for matching markers
  def check_win_columns
    left = []
    middle = []
    right = []
    columns = [left, middle, right]
    self.board.each do |row, value|
      left << value[0]
      middle << value[1]
      right << value[2]
    end
    columns.each do |column|
      if column.all? {|char| char == column.first && char != '%'}
        return column.first
      end
    end
    return false#No column win
  end
  #Checks diagonal for matching markers
  def check_diagonal
    top = [self.board[:top][0], self.board[:top][2]]
    middle = self.board[:middle][1]
    bottom = [self.board[:bottom][0], self.board[:bottom][2]]
    diagonal_one = [top[0], middle, bottom[1]]
    diagonal_two = [top[1], middle, bottom[0]]
    if diagonal_one.all? {|char| char == diagonal_one.first && char != '%'}
      return diagonal_one.first
    elsif diagonal_two.all? {|char| char == diagonal_two.first && char != '%'} 
      return diagonal_two.first
    else
      return false#No diagonal win
    end
  end

  #Runs all win or draw checking methods and returns their results
  def check_win
    if self.check_diagonal
      return self.check_diagonal
    elsif self.check_win_rows
      return self.check_win_rows
    elsif self.check_win_columns
      return self.check_win_columns
    else
      return self.check_draw
    end
  end
  #Reset the board
  def reset
    self.board.each do |key, value|
      value.each_with_index {|char, index| value[index] = '%'}
    end
  end
end
