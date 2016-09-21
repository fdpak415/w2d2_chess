require_relative "null_piece.rb"
require "byebug"

module SlidingPiece

  def moves(move_dirs,board)
    result = []
    result += diagonals(pos, board) if move_dirs[:diagonals]
    result += straight(pos, board) if move_dirs[:straight]

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
    result = []
    x_offset = -1
    y_offset = -1
    while true
      next_pos = [pos.first + x_offset, pos.last + y_offset]
      if !within_board?(next_pos, board)
        break
      elsif board[next_pos].class != NullPiece
        if board[next_pos].color == color
          break
        else
          result << next_pos
          break
        end
      else
        result << next_pos
      end
      x_offset -= 1
      y_offset -= 1
    end
    result
  end

  def ne(pos, board)
    #NE
    result = []
    x_offset = -1
    y_offset = 1
    while true
      next_pos = [pos.first + x_offset, pos.last + y_offset]
      if !within_board?(next_pos, board)
        break
      elsif board[next_pos].class != NullPiece
        if board[next_pos].color == color
          break
        else
          result << next_pos
          break
        end
      else
        result << next_pos
      end
      x_offset -= 1
      y_offset += 1
    end
    result
  end

  def se(pos, board)
    #SE
    result = []
    x_offset = 1
    y_offset = 1
    while true
      next_pos = [pos.first + x_offset, pos.last + y_offset]
      if !within_board?(next_pos, board)
        break
      elsif board[next_pos].class != NullPiece
        if board[next_pos].color == color
          break
        else
          result << next_pos
          break
        end
      else
        result << next_pos
      end
      x_offset += 1
      y_offset += 1
    end
    result
  end

  def sw(pos, board)
    #SW
    result = []
    x_offset = 1
    y_offset = -1
    while true
      next_pos = [pos.first + x_offset, pos.last + y_offset]
      if !within_board?(next_pos, board)
        break
      elsif board[next_pos].class != NullPiece
        if board[next_pos].color == color
          break
        else
          result << next_pos
          break
        end
      else
        result << next_pos
      end
      x_offset += 1
      y_offset -= 1
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
    while true
      next_pos = [pos.first + x_offset, pos.last + y_offset]
      if !within_board?(next_pos, board)
        break
      elsif board[next_pos].class != NullPiece
        if board[next_pos].color == color
          break
        else
          result << next_pos
          break
        end
      else
        result << next_pos
      end
      x_offset -= 1
      y_offset += 0
    end
    result

  end

  def e(pos, board)
    #East
    result = []
    x_offset = 0
    y_offset = 1
    while true
      next_pos = [pos.first + x_offset, pos.last + y_offset]
      if !within_board?(next_pos, board)
        break
      elsif board[next_pos].class != NullPiece
        if board[next_pos].color == color
          break
        else
          result << next_pos
          break
        end
      else
        result << next_pos
      end
      x_offset += 0
      y_offset += 1
    end
    result
  end

  def s(pos, board)
    #South
    result = []
    x_offset = 1
    y_offset = 0
    while true
      next_pos = [pos.first + x_offset, pos.last + y_offset]
      if !within_board?(next_pos, board)
        break
      elsif board[next_pos].class != NullPiece
        if board[next_pos].color == color
          break
        else
          result << next_pos
          break
        end
      else
        result << next_pos
      end
      x_offset += 1
      y_offset += 0
    end
    result
  end

  def w(pos, board)
    #West
    result = []
    x_offset = 0
    y_offset = -1
    while true
      next_pos = [pos.first + x_offset, pos.last + y_offset]
      if !within_board?(next_pos, board)
        break
      elsif board[next_pos].class != NullPiece
        if board[next_pos].color == color
          break
        else
          result << next_pos
          break
        end
      else
        result << next_pos
      end
      x_offset += 0
      y_offset -= 1
    end
    result
  end
end
