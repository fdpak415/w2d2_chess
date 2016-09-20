require_relative 'pieces.rb'
require 'byebug'

class Pawn < Piece

  attr_reader :move_dirs

  def initialize(board, pos, color)
    @move_dirs = {:pawn => true}
    super(board, pos, color)
  end

end
