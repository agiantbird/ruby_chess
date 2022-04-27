class Bishop < Piece
	include Slideable

	def move_dirs
		[
			[1,   1],
			[1,  -1],
			[-1, -1],
			[-1,  1]
		]
	end

	def to_s
		color == :black ? "♝" : "♗"
	end
end
