require_relative './lib/invalid_move_error.rb'
require_relative './lib/pieces.rb'
require_relative './lib/board_renderer_text.rb'
require_relative './lib/board.rb'
require_relative './lib/player.rb'
require_relative './lib/game.rb'

# b = Board.new
# b[[1,1]] = King.new(b, :black, [1,1])
# b[[2,2]] = Queen.new(b, :white, [2,2])
# b[[6,6]] = King.new(b, :white, [6,6])

# puts b.in_check?(:black)
# puts b.in_check?(:white)

b = Board.new
b [[0, 0]] = King.new(b, :black, [0,0])

b [[6, 6]] = King.new(b, :white, [6,6])

b [[3, 0]] = Rook.new(b, :white, [3,0])
b [[3, 1]] = Rook.new(b, :white, [3,1])

puts b.checkmate?(:black)
# board = Board.start_chess
# g = Game.new(
# 	board,
# 	Player.new(:black),
# 	Player.new(:white),
# 	BoardRendererText
# )
# g.play