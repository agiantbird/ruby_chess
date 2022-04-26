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
b [[1, 1]] = King.new(b, :black, [1,1])
b [[6, 6]] = King.new(b, :white, [6,6])

b [[3, 2]] = Rook.new(b, :white, [3,2])
b [[4, 2]] = Rook.new(b, :white, [4,2])

puts b.checkmate?(:black)

# board = Board.start_chess
g = Game.new(
	b,
	Player.new(:black),
	Player.new(:white),
	BoardRendererText
)
g.play





