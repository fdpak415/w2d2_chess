require_relative 'stepping_piece.rb'
require_relative 'pieces.rb'
require_relative 'null_piece.rb'
require 'byebug'

class Knight < Piece
  include SteppingPiece

  attr_reader :move_dirs

  def initialize(board, pos)
    @move_dirs = {:knight => true}
    super(board, pos)
  end

end

b = Board.new
k = b.grid[3][3]
#
p k.moves(k.move_dirs,b)
