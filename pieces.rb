require_relative "board.rb"
require_relative "null_piece.rb"

class Piece
attr_accessor :pos
attr_reader :board

  def initialize(board, pos = nil)
    @board = board
    @pos = pos
  end

  def moves

  end

end
