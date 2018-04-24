require "colorize"
require_relative 'cursor'
require_relative 'board'
class Display 
  SPRITES = {
    # :wk for white etc
    :K => 'K',
    :q => "q",
    :b => 'b',
    :k => 'k',
    :r => 'r',
    :p => 'p',
    nil => " "
  }
  #"/u2654"
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end
  
  
  def render
    grid_symbols = board.grid_symbols 
    grid_symbols.each_with_index do |row,y|
      line = []
      space = " ".colorize({:colors => :white, :background => :black})
      row.each_with_index do |symbol, x|
        line << color_translator([x,y],symbol, cursor.cursor_pos) 
      end 
      puts line.join()
    end 
  end
  attr_reader :cursor #for debugging 
  
  private
  
  def color_translator(pos, symbol, cursor_pos)
    y,x = pos
    color_hash = {}
    (x + y) % 2 == 0 ? color_hash[:background] = :black : color_hash[:background] = :white
    color_hash[:color] = :light_white
    color_hash[:background] = :red if cursor_pos == [y,x]
    color_hash[:mode] = :blink if cursor_pos == [y,x]
    
    SPRITES[symbol].colorize(color_hash)
  end
  
  attr_reader :board
end 



if __FILE__ == $0
  b = Board.new
  p b[[0,0]].moves
  d = Display.new(b)
  d.render
  # loop do 
  #   system("clear")
  #   d.render
  #   d.cursor.get_input
  #   d.render
  # end 
end