require_relative 'sliding_piece.rb'
require_relative 'pieces.rb'
require_relative 'null_piece.rb'
require 'byebug'

class Queen < Piece
  include SlidingPiece

  attr_reader :move_dirs

  def initialize(board, pos)
    @move_dirs = {:diagonals => true, :straight => true}
    super(board, pos)
  end

end

b = Board.new
q = b.grid[3][3]
#
p q.moves(q.move_dirs,b)
