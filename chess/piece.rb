
class Piece
    attr_reader :symbol
    def initialize(symbol, pos, board, color)
      @symbol = symbol
      @pos = pos
      @board = board 
      @color = color 
    end
    
    def moves 
      []
    end 
    
end 

class NullPiece
  require 'singleton'
  def initialize
    @symbol = nil
    @pos = nil 
  end
end 

  