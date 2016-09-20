
require_relative "null_piece.rb"
require "byebug"

module SteppingPiece


  def moves(move_dirs,board)
    result = []
      if move_dirs[:knight] == false
        result += diagonals(pos, board)
        result += straight(pos, board)
      else
        result = knight_moves(pos, board)
      end
    result
  end

  def knight_moves(pos, board)
    result = []
    #NNE
    result += knight_steps(pos, [-2, 1], board)
    #NEE
    result += knight_steps(pos, [-1, 2], board)
    #SEE
    result += knight_steps(pos, [1, 2], board)
    #SSE
    result += knight_steps(pos, [2, 1], board)
    #SSW
    result += knight_steps(pos, [2, -1], board)
    #SWW
    result += knight_steps(pos, [1, -2], board)
    #NWW
    result += knight_steps(pos, [-1, -2], board)
    #NNW
    result += knight_steps(pos, [-2, -1], board)

    return result
  end

  def knight_steps(pos, pos_offset, board)
    result = []

    next_pos = [pos.first + pos_offset[0], pos.last + pos_offset[1]]
      if !within_board?(next_pos, board)
        return result
      elsif board[next_pos].class != NullPiece
        #Check for enemy / self piece
        return result
      else
        result << next_pos
      end
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
    result = []
    x_offset = -1
    y_offset = -1

      next_pos = [pos.first + x_offset, pos.last + y_offset]
      if !within_board?(next_pos, board)
        return result
      elsif board[next_pos].class != NullPiece
        #Check for enemy / self piece
        return result
      else
        result << next_pos
      end

    result
  end

  def ne(pos, board)
    #NE
    result = []
    x_offset = -1
    y_offset = 1

      next_pos = [pos.first + x_offset, pos.last + y_offset]
      if !within_board?(next_pos, board)
        return result
      elsif board[next_pos].class != NullPiece
        #Check for enemy / self piece
        return result
      else
        result << next_pos
      end

    result
  end

  def se(pos, board)
    #SE
    result = []
    x_offset = 1
    y_offset = 1

      next_pos = [pos.first + x_offset, pos.last + y_offset]
      if !within_board?(next_pos, board)
        return result
      elsif board[next_pos].class != NullPiece
        #Check for enemy / self piece
        return result
      else
        result << next_pos
      end

    result
  end

  def sw(pos, board)
    #SW
    result = []
    x_offset = 1
    y_offset = -1

      next_pos = [pos.first + x_offset, pos.last + y_offset]
      if !within_board?(next_pos, board)
        return result
      elsif board[next_pos].class != NullPiece
        #Check for enemy / self piece
        return result
      else
        result << next_pos
      end

    result
  end

  def straight(pos, board)
    n(pos, board) + e(pos, board) + s(pos, board) + w(pos, board)
  end

  def n(pos, board)
    #North
    result = []
    x_offset = -1
    y_offset = 0

      next_pos = [pos.first + x_offset, pos.last + y_offset]
      if !within_board?(next_pos, board)
        return result
      elsif board[next_pos].class != NullPiece
        #Check for enemy / self piece
        return result
      else
        result << next_pos
      end

    result

  end

  def e(pos, board)
    #East
    result = []
    x_offset = 0
    y_offset = 1

      next_pos = [pos.first + x_offset, pos.last + y_offset]
      if !within_board?(next_pos, board)
        return result
      elsif board[next_pos].class != NullPiece
        #Check for enemy / self piece
        return result
      else
        result << next_pos
      end

    result
  end

  def s(pos, board)
    #South
    result = []
    x_offset = 1
    y_offset = 0

      next_pos = [pos.first + x_offset, pos.last + y_offset]
      if !within_board?(next_pos, board)
        return result
      elsif board[next_pos].class != NullPiece
        #Check for enemy / self piece
        return result
      else
        result << next_pos
      end

    result
  end

  def w(pos, board)
    #West
    result = []
    x_offset = 0
    y_offset = -1

      next_pos = [pos.first + x_offset, pos.last + y_offset]
      if !within_board?(next_pos, board)
        return result
      elsif board[next_pos].class != NullPiece
        #Check for enemy / self piece
        return result
      else
        result << next_pos
      end

    result
  end
end
