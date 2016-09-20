
require_relative 'null_piece.rb'
require_relative 'rook.rb'
require_relative 'knight.rb'
require_relative 'bishop.rb'
require_relative 'queen.rb'
require_relative 'king.rb'
require_relative 'pawn.rb'
require 'byebug'

class Board

  attr_reader :grid

  #def initialize(grid=Array.new(8) {Array.new(8) {Piece.new(self)}})
  def initialize(grid=Array.new(8) {Array.new(8) {nil}})
    @grid = grid
    place_black_pieces
    place_white_pieces
    assign_null_piece
  end

  def in_check?(color)
    king_pos = find_king_pos(color)

    @grid.each do |row|
      row.each do |square|
        #how to check
        if square.class != NullPiece && square.color != color
          p "flag"
          return true if square.moves(square.move_dirs,self).include?(king_pos)
        end
      end
    end
    false
  end

  def find_king_pos(color)
    @grid.each do |row|
      row.each do |square|
        if square.class == King && square.color == color
          return square.pos
        end
      end
    end
  end

  def place_black_pieces
    @grid[0].each_with_index do |square, square_idx|
      if square_idx == 0 || square_idx == 7
        @grid[0][square_idx] = Rook.new(self,[0,square_idx],:black)
      elsif square_idx == 1 || square_idx == 6
        @grid[0][square_idx] = Knight.new(self,[0,square_idx],:black)
      elsif square_idx == 2 || square_idx == 5
        @grid[0][square_idx] = Bishop.new(self,[0,square_idx],:black)
      elsif square_idx == 3
        @grid[0][square_idx] = Queen.new(self,[0,square_idx],:black)
      elsif square_idx == 4
        @grid[0][square_idx] = King.new(self,[0,square_idx],:black)
      end
    end

    @grid[1].each_with_index do |square, square_idx|
      @grid[1][square_idx] = Pawn.new(self,[1,square_idx], :black)
    end
  end

  def place_white_pieces
    @grid[7].each_with_index do |square, square_idx|
      if square_idx == 0 || square_idx == 7
        @grid[7][square_idx] = Rook.new(self,[7,square_idx],:white)
      elsif square_idx == 1 || square_idx == 6
        @grid[7][square_idx] = Knight.new(self,[7,square_idx],:white)
      elsif square_idx == 2 || square_idx == 5
        @grid[7][square_idx] = Bishop.new(self,[7,square_idx],:white)
      elsif square_idx == 3
        @grid[7][square_idx] = Queen.new(self,[7,square_idx],:white)
      elsif square_idx == 4
        @grid[7][square_idx] = King.new(self,[7,square_idx],:white)
      end
    end

    @grid[6].each_with_index do |square, square_idx|
      @grid[6][square_idx] = Pawn.new(self,[6,square_idx], :white)
    end
  end

  def assign_null_piece
    null = NullPiece.instance
    @grid.each_with_index do |row,row_idx|
      if row_idx.between?(2,5)
        @grid[row_idx].each_with_index do |square, square_idx|
          @grid[row_idx][square_idx] = null
          null.add_pos([row_idx,square_idx])
        end
      end
    end
  end


  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def move(start_pos_pos, end_pos)
    if @grid[start_pos_pos].nil?
      raise "There is no piece to move here"
    elsif @grid[end_pos].class != NullPiece
      raise "You cannot move there, there is already a piece there"
    end
    @grid[start_pos].pos = [end_pos]
    @grid[end_pos].pos = [start_pos]
    #remember to adjust for capturing pieces
    @grid[start_pos], @grid[end_pos] = @grid[end_pos], @grid[start_pos]
  end


end

# b = Board.new
#
# p b.grid
# pawn = b[[1,3]]
# p pawn.moves
