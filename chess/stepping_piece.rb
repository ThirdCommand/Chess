module STEPABLE
  def get_moves(pos, board, potential_moves)
    available_moves = []
    potential_moves.each do |move|
      new_pos =  [move[0]+pos[0], move[1]+pos[1]]
      case move_status(new_pos, board, pos)
      when :empty
        available_moves << new_pos
      when :blocked
        next
      when :enemy_piece
        available_moves << new_pos
        next
      end 
    end
    available_moves
    
    
  end
  
  # DRY ???
  def move_status(move, board, current_pos)
    return :blocked unless (0...8).cover?(move[0]) && (0...8).cover?(move[1])
    return :empty if board[move].symbol.nil?
    return :blocked if board[move].color == board[current_pos].color 
    return :enemy_piece if board[move].color != board[cursor_pos].color
  end 
end