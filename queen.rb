class Queen < Piece
  attr_reader :move_dirs

  def initialize
    @move_dirs = {:diagonal => true, :straight => true}
  end

end
