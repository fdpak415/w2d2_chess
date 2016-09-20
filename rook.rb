require_relative 'sliding_piece.rb'
require_relative 'pieces.rb'
require_relative 'null_piece.rb'
require 'byebug'

class Rook < Piece
  include SlidingPiece

  attr_reader :move_dirs

  def initialize(board, pos)
    @move_dirs = {:diagonals => false, :straight => true}
    super(board, pos)
  end

end
b = Board.new
r = b.grid[3][3]
#
p r.moves(r.move_dirs,b)
