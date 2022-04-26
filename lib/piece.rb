class Piece
	attr_reader :board, :color
	attr_accessor :location

	def initialize(board, color, location)
		@board = board
		@color = color
		@location = location
	end

	# available moves that don't move us into check
	def safe_moves
		moves = []
		# look at available moves
		available_moves.each do |move|
			#try the move
			new_board = board.deep_duplicate
			new_board.move_piece!(location, move)
			# if not in check, add the move
			if !new_board.in_check?(color)
					moves << move
			end
		end

		moves
	end

	def enemy?(location)
		!board[location].nil? && board[location].color != color
	end

	def current_row
		location.first
	end

	def current_column
		location.last
	end
end