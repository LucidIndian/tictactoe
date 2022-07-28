# Goal: Build a tic-tac-toe game on the command line 
# where two human players can play against each other 
# and the board is displayed in between turns.

class TictTacToe

  # instance variables (as symbols) to attr_XYZ.
  attr_reader :first, :second, :third, :fourth, :fifth, :sixth, :seventh, :eigth, :ninth
  attr_writer # any here?
  attr_accessor # any need both?

  @@game_count = 0 # Class variable (for practice)
  @@winning_combos = [] # if any of the winning combos are 3 of the same, return the winner
  @@available_picks = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  # if a user enters an unpickable number, return an error message

  def initialize
    @@game_count += 1 # incrementing the class variable to count # games (for practice)
    puts "new Game created"
    @current_board = [1, 2, 3, 4, 5, 6, 7, 8, 9] # array
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

    puts "Welcome to Tygh's TIC TAC TOE game!
    - Youngest person is player 1 (X)
    - Oldest person is player 2 (O)

  Player 1, enter your pick (0-9) then hit Return!"
  end

  public 
  # makes the methods below and until `private` accesible from outside the class

  # each spot on the board should be string interpolation
  # that shows the picks + remaining spots, defaults to the #.
  def show_board()

    puts "|#{@first}|#{@second}|#{@third}|"
    puts "-------"
    puts "|#{@fourth}|#{@fifth}|#{@sixth}|"
    puts "-------"
    puts "|#{@seventh}|#{@eigth}|#{@ninth}|"
    
    winner_check() #calling this to test if I can access private method
  end


  private 
  # makes the methods below inaccessible from outside the class - counterpart to `public` above

  def winner_check
    puts "Private method accessed!"
    # Comapre all winning combos to board
    # if match, declare winner
    # if no match, keep playing
    # if no spaces left, announce a tie and offer to play again
  end

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
    newGame.show_board
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

newGame.show_board