module Slideable	
	def available_moves
		moves = []

		move_dirs.each do |(diff_row, diff_col)|
			current_row, current_col = self.location

			loop do
				current_row += diff_row
				current_col += diff_col
				loc = [current_row, current_col]

				break if !board.in_bounds?(loc)

				if board.empty?(loc)
					moves.push(loc)
				end

				if enemy?(loc)
					moves << loc
					# break after first enemy piece (can't keep taking pieces after first)
					break
				end
			end
		end

		moves
	end
end
