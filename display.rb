require_relative "cursor.rb"
require "colorize"
require_relative "board.rb"

class Display

  attr_reader :cursor_pos

  def initialize(cursor = Cursor.new(board))
    @cursor = cursor
    @board = cursor.board
    @cursor_pos = cursor.cursor_pos
  end

  def render
    @board.grid.each_with_index do |row, row_i|
      puts "\n"
      row.each_with_index do |square, square_i|
        if [row_i, square_i] == @cursor_pos
          print " [] ".colorize(:red)
        else
          print " [] "
        end
      end
    end
  end



end
b = Board.new
c = Cursor.new(b)
d = Display.new(c)
p b.grid
# while true
#   d.render
#   c.get_input
#   system("clear")
# end
