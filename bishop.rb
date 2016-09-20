require_relative 'sliding_piece.rb'
require_relative 'pieces.rb'
require_relative 'null_piece.rb'
require 'byebug'
#debugger
class Bishop < Piece
  include SlidingPiece

  attr_reader :move_dirs

  def initialize(board,pos)
    @move_dirs = {:diagonals => true, :straight => false}
    super(board,pos)
  end

end

b = Board.new
p b[4,4].moves(@move_dirs)
