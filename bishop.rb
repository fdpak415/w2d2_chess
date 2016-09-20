require_relative 'sliding_piece.rb'

class Bishop < Piece
  include SlidingPiece
  
  attr_reader :move_dirs

  def initialize
    @move_dirs = {:diagonal => true, :straight => false}
  end

end
