require_relative 'piece'
require_relative 'stepping_piece'
class Knight < Piece
  include STEPABLE
  MOVES = [ 
    [2,1],[2,-1],[-1,2],[-1,-2],
    [-2,1],[-2,-1],[1,-2],[1,2]
  ]
  def moves 
    get_moves(@pos, @board, MOVES)
  end
end