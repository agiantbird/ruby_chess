require_relative './lib/board.rb'

b = Board.new
location = [0 , 0]
b[location] = "Y"
p b.grid
puts "-----"
puts b[location]

puts b.in_bounds?([-1, 0])
puts b.in_bounds?([1, 2])
puts b.in_bounds?([10, 0])