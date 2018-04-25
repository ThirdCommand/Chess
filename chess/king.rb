require_relative 'piece'
require_relative 'stepping_piece'
class King < Piece
  include STEPABLE
  MOVES = [ 
    [1,1],[1,-1],[-1,1],[-1,-1],
    [0,1],[0,-1],[ 1,0],[-1,0]
  ]
  def moves 
    get_moves(@pos, @board, MOVES)
  end
  
end