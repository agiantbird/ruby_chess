class Board
	attr_reader :grid

	def initialize
		@grid = [
			["X", "X", nil, "X"],
			["X", "X", nil, "X"],
			["X", "X", nil, "X"],
			["X", "X", nil, "X"]
		]
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
