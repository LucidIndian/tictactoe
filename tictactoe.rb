# Goal: Build a tic-tac-toe game on the command line 
# where two human players can play against each other 
# and the board is displayed in between turns.

puts "Welcome to Tygh's TIC TAC TOE game!
- Youngest person is player 1 (X)
- Oldest person is player 2 (O)

Player 1, enter your pick (0-9) then hit Return!"

def displayBoard(pick) 

  puts "p1 picked #{pick} & the board will be displayed here"

end

def playerOne(boardnum)

  displayBoard(boardnum) 

end

p1pick = gets.chomp.to_i
playerOne(p1pick)


# NOTES

# 9 spaces = 1-9
# |1|2|3|
# |4|5|6|
# |7|8|9|