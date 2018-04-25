require_relative 'piece'
class Pawn < Piece
  
  def moves 
    x,y = @pos 
    direction = -1 if @color == :white  
    direction = 1 if @color == :black 
    available_moves = []
    #p direction
    available_moves << [x, y + direction] if move_status([x, y + direction],@board, @pos) == :empty
    available_moves << [x + 1, y + direction] if move_status([x + 1, y + direction],@board, @pos) == :enemy_piece
    available_moves << [x - 1, y + direction] if move_status([x - 1, y + direction],@board, @pos) == :enemy_piece
    available_moves
  end 
  
  def double_move_status(pos)
    true if pos[1] == 1 && @color == :white # y reference frame?
    true if pos[]
    
  end
  
  def move_status(move, board, current_pos)
    
    return :blocked unless (0...8).cover?(move[0]) && (0...8).cover?(move[1])
    return :empty if board[move].symbol.nil?
    return :blocked if board[move].color == board[current_pos].color 
    return :enemy_piece if board[move].color != board[cursor_pos].color
  end 
  
end