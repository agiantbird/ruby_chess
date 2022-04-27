class Pawn < Piece
	
	def forward_dir
		color == :black ? 1 : -1
	end

	def at_start?
		(color == :black && current_row == 1) ||
			(color == :white && current_row == 6)
	end

	def available_moves
		moves = []
		one_forward = [current_row + forward_dir, current_column]

		# can move forward one
		if board.empty?(one_forward)
			moves << one_forward
		end

		# if first move, can move two spaces
		two_forward = [current_row + (2 * forward_dir), current_column]
		if board.empty?(one_forward) && board.empty?(two_forward) && at_start?
			moves << two_forward
		end

		# if enemy on diagonal, can move diagonal 1 into that spot
		# diag left
		diag_left = [current_row + forward_dir, current_column + 1]
		# diag right
		diag_right = [current_row + forward_dir, current_column + -1]

		if enemy?(diag_left)
			moves << diag_left
		end

		if enemy?(diag_right)
			moves << diag_right
		end

		moves.select {|m| board.in_bounds?(m)}
	end

	def to_s
		color == :black ? "♟" : "♙"
	end
end
