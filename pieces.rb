

class Piece
attr_accessor :pos
attr_reader :board

  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
  end


end
