require 'matrix'

module SLIDABLE
  def get_moves(pos, board, diagonal = false, axial = false)
    #opposite color okay to land on, but not pass
    #same color can't land on
    
    directions = []
    directions.concat([[1,1],[1,-1],[-1,1],[-1,-1]]) if diagonal
    directions.concat([[0,1],[0,-1],[ 1,0],[-1,0]]) if axial
    
    available_moves = []
    directions.each do |vector|
      distance = 1
      # how to refactor with multiple methods when you have to pass all this stuff everywhere
      while true
        potential_move = vector.map{|el| el*distance} 
      
        new_pos = [potential_move[0]+pos[0], potential_move[1]+pos[1]]
        
        case move_status(new_pos, board, pos)
        when :empty
          available_moves << new_pos
        when :blocked
          break
        when :enemy_piece
          available_moves << new_pos
          break 
        end 
        
        distance += 1
      end
    end
    
    return available_moves
    
  end
  
  def move_status(move, board, current_pos)
    return :blocked unless (0...8).cover?(move[0]) && (0...8).cover?(move[1])
    return :empty if board[move].symbol.nil?
    return :blocked if board[move].color == board[current_pos].color 
    return :enemy_piece if board[move].color != board[cursor_pos].color
  end 
end