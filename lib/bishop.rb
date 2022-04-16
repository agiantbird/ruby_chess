class Bishop

	attr_reader :color

	def initialize(color)
		@color = color
	end

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