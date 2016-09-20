require_relative 'sliding_piece.rb'
require_relative 'pieces.rb'
require 'byebug'

class Bishop < Piece
  include SlidingPiece

  attr_reader :move_dirs

  def initialize(board, pos, color)
    @move_dirs = {:diagonals => true, :straight => false}
    super(board,pos, color)
  end

end
