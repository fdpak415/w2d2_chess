class Rook < Piece
  attr_reader :move_dirs

  def initialize
    @move_dirs = {:diagonal => false, :straight => true}
  end

end
