require_relative "pieces.rb"
require_relative 'null_piece.rb'

class Board

  attr_reader :grid

  #def initialize(grid=Array.new(8) {Array.new(8) {Piece.new(self)}})
  def initialize(grid=Array.new(8) {Array.new(8) {NullPiece.new}})
    @grid = grid
    #remove everything below
    @grid[3][3] = Knight.new(self,[3,3])
    #@grid[3][2] = nil#Queen.new(self,[3,4])
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
