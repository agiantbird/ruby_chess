class Pawn

	attr_reader :color

	def initialize(location, color)
		@location = location
		@color = color
	end

	def move_dirs
		# [
		# 	#x, y
		# 	[0, 1]
		# 	[0, 2]
		# ]
	end

	def starting_pos?
		row == 1 || row == 6
	end

	def row
		@location.first
	end

	def column
		@location.last
	end

	def to_s
		color == :black ? "♟" : "♙"
	end
end

# move_dirs
# first_move?
# piece_capturable?
# each peice needs a reference to its own location