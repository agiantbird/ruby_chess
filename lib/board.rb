require_relative './bishop.rb'
require_relative './king.rb'
require_relative './knight.rb'
require_relative './pawn.rb'
require_relative './queen.rb'
require_relative './rook.rb'

class Board
	attr_reader :grid

	# factor method
	def self.start_chess
		board = self.new
		8.times do |c|
			board[[1, c]] = Pawn.new(:black)
			board[[6, c]] = Pawn.new(:white)
		end
		# board[[0,0]] = Rook.new(:black)
		# board[[0,7]] = Rook.new(:black)
		# board[[7,0]] = Rook.new(:white)
		# board[[7,7]] = Rook.new(:white)

		[[0, :black], [7, :white]].each do |(r, color)|
			board[[r, 0]] = Rook.new(color)
			board[[r, 7]] = Rook.new(color)
			board[[r, 1]] = Knight.new(color)
			board[[r, 6]] = Knight.new(color)
			board[[r, 2]] = Bishop.new(color)
			board[[r, 5]] = Bishop.new(color)
		end

		board[[0, 3]] = Queen.new(:black)
		board[[0, 4]] = King.new(:black)
		board[[7, 3]] = Queen.new(:white)
		board[[7, 4]] = King.new(:white)

		# make sure to return the actual instance
		board
	end

	def initialize
		# create an array of 8 empty arrays
		@grid = Array.new(8) { Array.new(8) }
	end

	# operator overloading
	def []=(location, piece)
		# array destructuring
		row, column = location
		# use the 'bare word' grid instead of instance var
		grid[row][column] = piece
	end

	# more operator overloading
	def [](location)
		row, column = location
		grid[row][column]
	end

	def in_bounds?(location)
		row, column = location

		row < grid.length &&
		column < grid.first.length &&
		row >= 0 &&
		column >= 0
	end
end
