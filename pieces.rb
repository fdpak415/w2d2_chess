class Piece
attr_accessor :pos

  def initialize(pos = nil)
    @pos = pos
  end

  def moves

  end

end

class SlidingPiece < Piece

  def moves(move_dir)

  end

end

class Bishop < SlidingPiece
  attr_reader :move_dirs

  def initialize
    @move_dirs = {:diagonal => true, :straight => false}
  end

end

class Rook < SlidingPiece
  attr_reader :move_dirs

  def initialize
    @move_dirs = {:diagonal => false, :straight => true}
  end

end


class Queen < SlidingPiece
  attr_reader :move_dirs

  def initialize
    @move_dirs = {:diagonal => true, :straight => true}
  end

end




class SteppingPiece < Piece


end

class Knight < SteppingPiece

end

class King < SteppingPiece

end
