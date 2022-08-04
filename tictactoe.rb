# Tic Tac Toe
module TestModule # module test - convert to something useful?
  TTT = "Tic Tac Toe" # constant to be used by instances/ both classes
end

class TictTacToe
  include TestModule # module test - convert to something useful?
  # instance variables (as symbols) to attr_XYZ.
  attr_reader :first, :second, :third, :fourth, :fifth, :sixth, :seventh, :eigth, :ninth, :player1, :player2
  attr_writer # any here?
  attr_accessor :board, :board_test, :winner

  @@game_count = 0 # Class variable (for practice)

  # Constant (as array positions)
  WINNING_COMBOS = [
    [0,1,2], 
    [3,4,5], 
    [6,7,8], 
    [0,3,6], 
    [1,4,7], 
    [2,5,8], 
    [0,4,8], 
    [6,4,2]] 
  @@available_picks = [1, 2, 3, 4, 5, 6, 7, 8, 9] # not using this anywhere yet
  # if a user enters an unpickable number, return an error message

  def initialize (player1_obj, player2_obj)
    @@game_count += 1 # incrementing the class variable to count # games (for practice)
    puts "Starting a new #{TTT} game..." # TTT constant from the module
    sleep 1.0
    @board = ['1', '2', '3', '4', '5', '6', '7', '8', '9'] # array of which chars are printed to the game board 
    @board_test = ['1', '2', 'X', '4', 'X', '6', 'X', '8', '9']
    @winner = false
    @player1 = player1_obj # inserting player object to access attributes within the game
    @player2 = player2_obj # inserting player object to access attributes within the game
  end

  def self.total_number_of_games # Class method to read the class variable
    @@game_count
  end

  public # makes the methods below accesible from outside the class, until `private`

  def start()
    # after displaying the new board, get player to enter pick
    # replace the # of their pick with their shape
    # until winner = true 
    # Keep alternating players picking
    player1_shape = player1.shape
    player2_shape = player2.shape
    current_player = player1
    player_shape = current_player.shape
    puts "OK player #{current_player.name}, enter your pick # then hit return"
    player_pick = gets.chomp.to_i - 1 # local variable
      # write code that errors if it's not available, in the change_board method?
    puts "player picked #{player_pick + 1}"  # +1 to match board visual, not the array position
    sleep 1.0
    change_board(player_pick, player_shape)
     # switch current_player after the pick so the next pick is entered in the alternate shape
    if current_player == player1 
      current_player = player2
    else
      current_player = player1
    end

    puts "Current player should now be 2?: #{current_player.name}"

  end

  def change_board(player_pick, player_shape)
    board[player_pick] = player_shape # replacing the board number with player's symbol 
    show_board
  end

  def show_board()
    # each spot on the board should be string interpolation
    # that shows the picks + remaining spots, defaults to the #.
    puts "|#{board[0]}|#{board[1]}|#{board[2]}|"
    puts "-------"
    puts "|#{board[3]}|#{board[4]}|#{board[5]}|"
    puts "-------"
    puts "|#{board[6]}|#{board[7]}|#{board[8]}|"
    winner_check() #calling this to test if I can access private method
  end

  private # makes methods below inaccessible from outside the class - see to `public` above

  def winner_check
    # Compare all winning combos to current board
    # if match, declare winner (show message and no picks, replay?)
    # if no match, keep playing (next play)
    # if no spaces left, announce a tie and offer to play again
    WINNING_COMBOS.each do |win_arr_combo|
      combo_conversion = win_arr_combo.map do |char|
        # Next, get picks to change `board``, 
        # then write below to use the `board` instead of board_test
        board_test[char]
      end
  
      @winner = combo_conversion.all? { |char| char == 'X' || char == 'O' }

      if @winner == true
        puts "There'a winner!"
        else
         # nothing yet
      end
    end

  end 
end # Class end

class Player
  include TestModule # module test - convert to something useful?
  attr_accessor :name # now I can read this later with `.name`
  attr_reader :shape  # now I can read this later with `.shape`

  def initialize(name, shape)
    @name = name
    @shape = shape
    puts "Good luck, #{name}!"
  end
  
  
end # Class end


# GAME START SEQUENCE
puts "
\
Hello and welcome to Tygh's TIC TAC TOE game!"
puts "Player 1 will be X, please type your name then hit return."
p1_name = gets.chomp
sleep 0.5
player1 = Player.new(p1_name, "X")
sleep 0.5
puts "Player 2 will be O, please type your name then hit return."
p2_name = gets.chomp
sleep 0.5
player2 = Player.new(p2_name, "O")
sleep 1
puts "OK, it's #{p1_name} vs. #{p2_name}, let's do this!"
sleep 1

newGame = TictTacToe.new(player1, player2) # Passing player objects to have access to name and symbol for picks

newGame.show_board
puts "This is game ##{TictTacToe.total_number_of_games}" # Test. Working! Calling our class method.
newGame.start

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