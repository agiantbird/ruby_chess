class Pawn < Piece
	#include Stepable
	def forward_dir
		color == :black ? -1 : 1
	end

	def to_s
		color == :black ? "♟" : "♙"
	end

	def move_dirs
		[[0, 1]]
	end
end
