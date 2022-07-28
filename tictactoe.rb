# Goal: Build a tic-tac-toe game on the command line 
# where two human players can play against each other 
# and the board is displayed in between turns.



class TictTacToe

  attr_accessor :turn, :first, :second, :third, :fourth, :fifth, :sixth, :seventh, :eigth, :ninth

  @@game_count = 0 # Class variable (for practice)
  @@winning_combos = [] # if any of the winning combos are 3 of the same, return the winner
  @@available_picks = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  # if a user enters an unpickable number, return an error message


  def initialize
    @@game_count += 1 # incrementing the class variable to count # games (for practice)
    puts "new Game created"
    @current_board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    # set initial board positiion values
    @first = @current_board[0]
    @second = @current_board[1]
    @third = @current_board[2]
    @fourth = @current_board[3]
    @fifth = @current_board[4]
    @sixth = @current_board[5]
    @seventh = @current_board[6]
    @eigth = @current_board[7]
    @ninth = @current_board[8]
    
  end

  # each spot on the board should be string interpolation
  # that shows the picks + remaining spots, defaults to the #.
  def showBoard()

    puts "|#{@first}|#{@second}|#{@third}|"
    puts "-------"
    puts "|#{@fourth}|#{@fifth}|#{@sixth}|"
    puts "-------"
    puts "|#{@seventh}|#{@eigth}|#{@ninth}|"
  end

  puts "Welcome to Tygh's TIC TAC TOE game!
    - Youngest person is player 1 (X)
    - Oldest person is player 2 (O)

  Player 1, enter your pick (0-9) then hit Return!"

end


class Player

  attr_reader :shape # makes it so i can read this later with `.shape`

  def initialize(shape)
    @shape = shape
    puts "new player created"
  end
  
  def turn()
    # after displaying the new board, get player to enter pick
    # replace the # of their pick with their shape
    #pick =  1 # later, gets.chomp()
    @first = 'X'
    newGame.showBoard
  end
  
end


# puts "New TICTACTOE game? Y/N"
# reply = gets.chomp
# while reply == "Y" 
#   puts "great!"
#   tictactoe = Game.new

# else
#   puts "Don't want to play?"
#   sleep (1)
#   puts "New TICTACTOE game? Y/N"
#   reply = gets.chomp
# end 

newGame = TictTacToe.new

player1 = Player.new("X")
player2 = Player.new("O")
puts player1.shape
puts player2.shape

newGame.showBoard

newGame.turn