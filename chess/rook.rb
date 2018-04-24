require_relative 'piece'
require_relative 'sliding_piece'
class Rook < Piece
  include SLIDABLE
  DIAGONAL = false
  AXIAL = true
  
  def moves 
    get_moves(@pos, @board, DIAGONAL, AXIAL)
  end
  
end