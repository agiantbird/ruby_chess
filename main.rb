require_relative './lib/board.rb'
require_relative './lib/pawn.rb'
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

pawn = Pawn.new([1, 0], :black)
puts pawn

pawn2 = Pawn.new([1,1], :white)
puts pawn2