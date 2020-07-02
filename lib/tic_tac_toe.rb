def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

WIN_COMBINATIONS = [
 [0,1,2],  #TOP ROW
 [3,4,5],  #MIDDLE ROW
 [6,7,8],  #BOTTOM ROW
 [0,3,6],  #LEFT ROW
 [1,4,7],  #MIDDLE VERTICAL ROW
 [2,5,8],  #RIGHT ROW
 [0,4,8],  #DIAGNAL left
 [6,4,2]  #DIAGNOL right
]


def input_to_index(user_input)
  user_input.to_i - 1
end

def move(board, position, current_player)
  board[position] = current_player
end

def position_taken?(array, ind)
  if array[ind] == " " || array[ind] == "" || array[ind] == nil
    return false
  else
    return true
  end
end

def valid_move?(board, index)
  def position_taken?(array, ind)
    if array[ind] == " " || array[ind] == "" || array[ind] == nil
      return false
    else
      return true
    end
  end

  def on_board?(num)
    if num.between?(0, 8) == true
      return true
    else
      return false
    end
  end

  if (position_taken?(board, index)) == false && (on_board?(index) == true)
    return true
  else
    return false
  end


end

def turn(board)
  puts "Please enter 1-9:"
  num = gets.chomp
  index = input_to_index(num)
  if valid_move?(board, index) == true
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def turn_count(board)
  turns = 0
  board.each do |space|
    if space == "X" || space == "O"
      turns += 1
    end
  end
  return turns
end

def won?(board)
  WIN_COMBINATIONS.each do |win_combo|
    win_index_1 = win_combo[0]
    win_index_2 = win_combo[1]
    win_index_3 = win_combo[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combo
  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combo
  end
end
  return false
  end

  def full?(board)
   board.all? do |index|
     index == "X" || index =="O"
   end
 end

 def draw?(board)
   if !won?(board) && full?(board)
     return true
   else
     false
   end
 end

 def over?(board)
   if won?(board) || full?(board) || draw?(board)
     return true
   else
     false
   end
 end

 def winner (board)
   index = []
   index = won?(board)
   if index == false
     return nil
   else
     if board[index[0]] == "X"
       return "X"
     else
       return "O"
     end
   end
 end
