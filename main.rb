require_relative './lib/pieces.rb'
require_relative './lib/board_renderer_text.rb'
require_relative './lib/board.rb'

b = Board.start_chess
# add pieces with PieceName.new(board, :color, loc)
text_board = BoardRendererText.new(b)
# puts text_board.render

b[[2, 2]] = Pawn.new(b, :white, [2,2])
b[[2, 0]] = Pawn.new(b, :white, [2,0])
p b[[1,2]].available_moves
puts text_board.render


# b = Board.new
# b[[0, 2]] = King.new(b, :black, [2, 2])
# p b[[2, 2]].available_moves
# b[[0, 1]] = Pawn.new(b, :white)

# piece = b[[0,0]]
# puts piece.enemy?([0,1])