require "singleton"

class Piece
    attr_reader :symbol, :color
    def initialize(symbol, pos, board, color)
      @symbol = symbol
      @pos = pos
      @board = board 
      @color = color 
    end
    
    def board_symbol 
      @color == :white ? [:w, symbol] : [:b, symbol]
    end

    def moves 
      []
    end 
    
    
end 

require_relative "null_piece"
require_relative "queen"
require_relative 'king'
require_relative 'pawn'
require_relative 'rook'
require_relative 'knight'
require_relative 'bishop'