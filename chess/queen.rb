require_relative 'piece'
require_relative 'sliding_piece'
class Queen < Piece
  include SLIDABLE
  DIAGONAL = true
  AXIAL = true
  
  def moves 
    get_moves(@pos, @board, DIAGONAL, AXIAL)
  end
  
end