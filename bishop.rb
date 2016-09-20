require_relative 'sliding_piece.rb'
require_relative 'pieces.rb'
require_relative 'null_piece.rb'
require 'byebug'

class Bishop < Piece
  include SlidingPiece

  attr_reader :move_dirs

  def initialize(board, pos)
    @move_dirs = {:diagonals => true, :straight => false}
    super(board,pos)
  end

end
  # debugger
b = Board.new
bish = b.grid[3][3]

p bish.moves(bish.move_dirs,b)
