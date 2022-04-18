require_relative './lib/pieces.rb'
require_relative './lib/board.rb'
require_relative './lib/board_renderer_text.rb'

b = Board.start_chess

text_board = BoardRendererText.new(b)
puts text_board.render
# pawn = Pawn.new([1, 0], :black)
# puts pawn

# pawn2 = Pawn.new([1,1], :white)
# puts pawn2