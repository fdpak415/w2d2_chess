require_relative 'stepping_piece.rb'
require_relative 'pieces.rb'
require 'byebug'

class Knight < Piece
  include SteppingPiece

  attr_reader :move_dirs

  def initialize(board, pos, color)
    @move_dirs = {:knight => true}
    super(board, pos, color)
  end

end
