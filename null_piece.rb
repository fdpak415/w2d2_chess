require 'singleton'

class NullPiece
   include Singleton

  attr_writer :add_pos, :delete_pos
  attr_reader :pos_arr

  def initialize
    @pos_arr = []
  end

  def add_pos(pos)
    @pos_arr << pos
  end

  def delete_pos(pos)
    @pos_arr.delete(pos)
  end

end
