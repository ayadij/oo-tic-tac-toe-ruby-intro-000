class TicTacToe

  def initialize(board = nil)
    @board = board || Array.new(9, " ")
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  # prints the current board representation based on the @board instance variable
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  # user input translated into board array index
  def input_to_index(input)
    input.to_i - 1
  end

  # players choice of move and which player
  def move(index, current_player)
    @board[index] = current_player
  end

  # evaluates if the move is occupied or available
  def position_taken?(index)  # T = position taken
    @board[index] != " "      # F = position not taken
  end

  # evaluates if the move is valid (if it exists and available)
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end

  # a single complete turn 
  def turn
    puts "Please enter 1-9:"      # ask for input
    input = gets.strip            # get input
    index = input_to_index(input) # translates input into index
    if valid_move? (index)        # if index is valid
      move(index, current_player)   # make the move for index
      display_board                 # show the board
    else                          # else
      turn                          # ask for input again
    end                           # end
  end 

  # returns the number of turns that have been played based on @board variable
  def turn_count
    (@board.count{|element|element=="X"}) + (@board.count{|element|element=="O"})
  end

  # determines which player's turn it is using the turn_count method
  def current_player
    if turn_count % 2 == 0
      return "X"
    else
      return "O"
    end
  end

  # return false/nil if there are no wins
  # returns the winning combination indexes as an array if there is a win
  def won?
    win_index_0 = WIN_COMBINATIONS[0]
    win_index_1 = WIN_COMBINATIONS[1]
    win_index_2 = WIN_COMBINATIONS[2]
    win_index_3 = WIN_COMBINATIONS[3]
    win_index_4 = WIN_COMBINATIONS[4]
    win_index_5 = WIN_COMBINATIONS[5]
    win_index_6 = WIN_COMBINATIONS[6]
    win_index_7 = WIN_COMBINATIONS[7]
    if @board[win_index_0[0]] == "X" && @board[win_index_0[1]] == "X" && @board[win_index_0[2]] == "X"
      win_index_0
    elsif @board[win_index_0[0]] == "O" && @board[win_index_0[1]] == "O" && @board[win_index_0[2]] == "O"
      win_index_0
    elsif @board[win_index_1[0]] == "X" && @board[win_index_1[1]] == "X" && @board[win_index_1[2]] == "X"
      win_index_1
    elsif @board[win_index_1[0]] == "O" && @board[win_index_1[1]] == "O" && @board[win_index_1[2]] == "O"
      win_index_1
    elsif @board[win_index_2[0]] == "X" && @board[win_index_2[1]] == "X" && @board[win_index_2[2]] == "X"
      win_index_2
    elsif @board[win_index_2[0]] == "O" && @board[win_index_2[1]] == "O" && @board[win_index_2[2]] == "O"
      win_index_2
    elsif @board[win_index_3[0]] == "X" && @board[win_index_3[1]] == "X" && @board[win_index_3[2]] == "X"
      win_index_3
    elsif @board[win_index_3[0]] == "O" && @board[win_index_3[1]] == "O" && @board[win_index_3[2]] == "O"
      win_index_3
    elsif @board[win_index_4[0]] == "X" && @board[win_index_4[1]] == "X" && @board[win_index_4[2]] == "X"
      win_index_4
    elsif @board[win_index_4[0]] == "O" && @board[win_index_4[1]] == "O" && @board[win_index_4[2]] == "O"
      win_index_4
    elsif @board[win_index_5[0]] == "X" && @board[win_index_5[1]] == "X" && @board[win_index_5[2]] == "X"
      win_index_5
    elsif @board[win_index_5[0]] == "O" && @board[win_index_5[1]] == "O" && @board[win_index_5[2]] == "O"
      win_index_5
    elsif @board[win_index_6[0]] == "X" && @board[win_index_6[1]] == "X" && @board[win_index_6[2]] == "X"
      win_index_6
    elsif @board[win_index_6[0]] == "O" && @board[win_index_6[1]] == "O" && @board[win_index_6[2]] == "O"
      win_index_6
    elsif @board[win_index_7[0]] == "X" && @board[win_index_7[1]] == "X" && @board[win_index_7[2]] == "X"
      win_index_7
    elsif @board[win_index_7[0]] == "O" && @board[win_index_7[1]] == "O" && @board[win_index_7[2]] == "O"
      win_index_7
    else
      return false
    end
  end

  # return true if every element in the board contains either an "X" or an "O"
  def full?
    @board.none?{|element|element==" "}
  end

  # returns true if the board is full and has no wins
  # returns false otherwise
  def draw?
    !won? && full?
  end

  # returns true if the game is over, ie, if the board has been won or is full 
  def over?
    won? || draw?
  end

  # returns who won the game
  def winner
    if !!won? && @board[won?[0]] == "X"
      "X"
    elsif !!won? && @board[won?[0]] == "O"
      "O"
    else
      return nil
    end
  end



  # main method of the game and responsible for the loop.
  def play
    until over?       # until the game is over,
      turn              # take turns
    end
    if won?           # if the game is won,
      puts "Congratulations #{winner}!"   # puts
    else              # else if the game was a draw
      puts "The Game Has Ended in a Draw!"    # puts
    end
  end

end

# https://github.com/ayadij/tic-tac-toe 