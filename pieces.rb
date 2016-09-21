

class Piece
attr_accessor :pos
attr_reader :board, :color

  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
  end

  def move_into_check?(pos)
    dup_board = board.deep_dup

    dup_board.in_check?(@color)
  end

end
