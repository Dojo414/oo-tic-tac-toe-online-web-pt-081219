class TicTacToe
  
  def initialize
    @board = Array.new(9, " ")
  end
  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [6,4,2], [0,4,8]]
  
  def display_board
    puts "-----------"
    puts "| #{@board[0]} | #{@board[1]} | #{@board[2]} |"
    puts "| #{@board[3]} | #{@board[4]} | #{@board[5]} |"
    puts "| #{@board[6]} | #{@board[7]} | #{@board[8]} |"
  end
  
  def input_to_index(user_space)
    user_index = user_space.to_i - 1
    user_index
  end
  
  def move(index, token="X")
    @board[index] = token
  end
  
  def position_taken?(position)
   ((@board[position] == "X") || (@board[position] == "O")) 
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    user_move = gets
    user_index = input_to_index(user_move)
    token = current_player
    if valid_move?(user_index)
      move(user_index, token)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    count = 0 
    @board.each do |value|
      if value == "X" || value == "O"
        count += 1 
      end
    end
    count
  end
  
  def current_player
    if turn_count % 2 == 0 
      token = "X"
    else
      token = "O"
    end
    token
  end
  
  def won?
  WIN_COMBINATIONS.detect do |combo|
    if (@board[combo[0]]) == "X" && (@board[combo[1]]) == "X" && (@board[combo[2]]) == "X"
      return combo
    elsif (@board[combo[0]]) == "O" && (@board[combo[1]]) == "O" && (@board[combo[2]]) == "O"
      return combo
    end
      false
  end
end

def full?
  turn_count == 9
end

def draw?
  full? && !won?
end

def over?
  won? || draw?
end

def winner
  if won?
    return @board[won?[0]]
  end
end

def play 
  until over?
  turn
  end
  if won?
    winning_token = winner
    puts "Congratulations #{winning_token}!"
  else
    puts "Cat's Game!"
  end
end
  
end