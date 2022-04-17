require_relative './lib/bishop.rb'
require_relative './lib/board.rb'
require_relative './lib/board_renderer_text.rb'
require_relative './lib/king.rb'
require_relative './lib/knight.rb'
require_relative './lib/pawn.rb'
require_relative './lib/queen.rb'
require_relative './lib/rook.rb'

b = Board.start_chess

text_board = BoardRendererText.new(b)
puts text_board.render
# pawn = Pawn.new([1, 0], :black)
# puts pawn

# pawn2 = Pawn.new([1,1], :white)
# puts pawn2