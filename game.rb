require_relative 'player.rb'
require_relative 'board.rb'

class Game

  def initialize
    @p1 = Player.new
    @p2 = Player.new
    @b = Board.new
  end

  def play
    @taken_spaces = []
    @count = 0

    intro

    loop do 

      @count % 2 == 0 ? player = @p1 : player = @p2

      
      take_turn(player)

      @b.display_board

      if win?(player)
        congrats
        break
      end

      if draw?
        puts "It's a Tie!"
        break
      end

      @count += 1
    end
  end

  public

  def take_turn pl
    puts "Player #{pl.name}: Enter a location:"
    location = gets.chomp.to_i - 1
    pl.update_picks(location)
    @b.update_board(pl.token, location)
    location
  end



  private

  def win? player 
    winning_combos = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    player_picks = player.picks 
    winning_combos.each do |win|
    count = 0
    player_picks.each do |p|
      if win.include?(p)
        count += 1
      end
    end
    if count == 3
      return true
    end
  end
  return false
  end

  def draw?
    @count == 9
  end

  def is_valid? location
    if @taken_spaces.include?(location)
      return false
    else
      return true
    end
  end

  def congrats
    puts "You Win!"
  end

  def intro
    puts "Welcome to Tic Tac Toe"
    sleep 1
    puts
    puts "Player 1 enter a name:"
    @p1.name = gets.chomp
    puts "Enter your character"
    @p1.token = gets.chomp
    puts 
    puts "Player 2 enter a name:"
    @p2.name = gets.chomp
    puts "Enter your character"
    @p2.token = gets.chomp
    puts
  end

end


a = Game.new
a.play












