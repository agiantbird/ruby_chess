require_relative './lib/bishop.rb'
require_relative './lib/board.rb'
require_relative './lib/board_renderer_text.rb'
require_relative './lib/king.rb'
require_relative './lib/knight.rb'
require_relative './lib/pawn.rb'
require_relative './lib/queen.rb'
require_relative './lib/rook.rb'

# b = Board.new
# location = [0 , 0]
# b[location] = "Y"
# p b.grid
# puts "-----"
# puts b[location]

# puts b.in_bounds?([-1, 0])
# puts b.in_bounds?([1, 2])
# puts b.in_bounds?([10, 0])

b = Board.new
b[[1,0]] = Pawn.new(:black)
b[[1,1]] = Pawn.new(:black)
b[[1,2]] = Pawn.new(:white)
b[[1,3]] = Pawn.new(:black)
b[[1,4]] = Pawn.new(:black)
b[[1,5]] = Pawn.new(:black)
b[[1,6]] = Pawn.new(:black)
b[[1,7]] = Pawn.new(:black)

text_board = BoardRendererText.new(b)
puts text_board.render
# pawn = Pawn.new([1, 0], :black)
# puts pawn

# pawn2 = Pawn.new([1,1], :white)
# puts pawn2