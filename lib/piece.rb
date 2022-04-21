class Piece
	attr_reader :board, :color
	attr_accessor :location

	def initialize(board, color, location)
		@board = board
		@color = color
		@location = location
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