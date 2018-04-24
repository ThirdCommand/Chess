require_relative 'piece'

class NullPiece < Piece 
  include Singleton
  attr_reader :symbol 
  
  def initialize
    @symbol = nil
    @pos = nil 
  end
end 