require_relative 'pieces.rb'
require 'byebug'

class Pawn < Piece

  attr_reader :move_dirs

  def initialize(board, pos, color)
    @move_dirs = {:color => color}
    super(board, pos, color)
  end

  def moves(move_dirs,board)
    if @move_dirs[:color] == :white
      white_pawn_moves
    else
      black_pawn_moves
    end
  end

  def within_board?(pos, board)
    if pos.first.between?(0,7) && pos.last.between?(0,7)
      return true
    end
    false
  end

  def white_pawn_moves
    result = []
    new_pos = [pos.first - 1, pos.last + 0]

    if within_board?(new_pos,@board) && board[new_pos].class == NullPiece
      result << new_pos
    end

    new_pos = [pos.first - 1, pos.last - 1]
    left_diag = board[new_pos]
    if within_board?(new_pos,@board) && left_diag.class == Piece &&
      left_diag.color != self.color
      result << new_pos
    end

    new_pos = [pos.first - 1, pos.last + 1]
    right_diag = board[new_pos]
    if within_board?(new_pos,@board) && right_diag.class == Piece &&
      right_diag.color != self.color
      result << new_pos
    end

    new_pos = [pos.first - 2, pos.last - 0]
    if pos[0] == 6 && board[new_pos].class == NullPiece
      result << new_pos
    end
    result
  end

  def black_pawn_moves
    result = []
    new_pos = [pos.first + 1, pos.last + 0]

    if within_board?(new_pos,@board) && board[new_pos].class == NullPiece
      result << new_pos
    end

    new_pos = [pos.first + 1, pos.last + 1]
    left_diag = board[new_pos]
    if within_board?(new_pos,@board) && left_diag.class == Piece &&
      left_diag.color != self.color
      result << new_pos
    end

    new_pos = [pos.first + 1, pos.last - 1]
    right_diag = board[new_pos]
    if within_board?(new_pos,@board) && right_diag.class == Piece &&
      right_diag.color != self.color
      result << new_pos
    end

    new_pos = [pos.first + 2, pos.last + 0]
    if pos[0] == 1 && board[new_pos].class == NullPiece
      result << new_pos
    end
    result
  end



end
