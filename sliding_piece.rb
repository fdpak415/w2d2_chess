module SlidingPiece

  def moves(move_dir)
    result = []

    if move_dir[:diagonals]
      result += diagonals(pos, board)
    elsif move_dir[:straight]
      result += straight(pos, board)
    end

    result
  end

  def within_board?(pos, board)
    if pos.first.between?(0,7) && pos.last.between?(0,7)
      return true
    end
    false
  end

  def diagonals(pos, board)
    nw(pos, board) + ne(pos, board) + se(pos, board) + sw(pos, board)
  end

  def nw(pos, board)
    #NW
    until true
      next_pos = [pos.first - 1, pos.last - 1]
      if !within_board?(next_pos, board)
        break
      elsif board[next_pos].class != NullPiece
        #Check for enemy / self piece
        break
      else
        result << next_pos
      end
    end
    result
  end

  def ne(pos, board)
    #NE
    until true
      next_pos = [pos.first - 1, pos.last + 1]
      if !within_board?(next_pos, board)
        break
      elsif board[next_pos].class != NullPiece
        #Check for enemy / self piece
        break
      else
        result << next_pos
      end
    end
    result
  end

  def se(pos, board)
    #SE
    until true
      next_pos = [pos.first + 1, pos.last + 1]
      if !within_board?(next_pos, board)
        break
      elsif board[next_pos].class != NullPiece
        #Check for enemy / self piece
        break
      else
        result << next_pos
      end
    end
    result
  end

  def sw(pos, board)
    #SW
    until true
      next_pos = [pos.first + 1, pos.last - 1]
      if !within_board?(next_pos, board)
        break
      elsif board[next_pos].class != NullPiece
        #Check for enemy / self piece
        break
      else
        result << next_pos
      end
    end
    result
  end

  def straight(pos, board)

  end


end
