module Stepable	
	def available_moves
		moves = []

		move_dirs.each do |(diff_row, diff_col)|
			current_row, current_col = self.location

			current_row += diff_row
			current_col += diff_col
			loc = [current_row, current_col]

			#next if !board.in_bounds?(loc)

			if legal_move?(loc)
				moves.push(loc)
			end
		end

		moves
	end

	def legal_move?(loc)
		board.in_bounds?(loc) && (board.empty?(loc) || enemy?(loc))
	end
end
