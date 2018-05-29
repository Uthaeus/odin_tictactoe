

class Board
  attr_accessor :board 
  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts "   #{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "  -----------"
    puts "   #{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "  -----------"
    puts "   #{@board[6]} | #{@board[7]} | #{@board[8]}"
  end

  def update_board token, location
    @board[location] = token
  end

  def board
    @board 
  end
end


