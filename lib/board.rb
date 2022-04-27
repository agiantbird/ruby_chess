require_relative './pieces/bishop.rb'
require_relative './pieces/king.rb'
require_relative './pieces/knight.rb'
require_relative './pieces/pawn.rb'
require_relative './pieces/queen.rb'
require_relative './pieces/rook.rb'
require_relative './pieces/piece.rb'

class Board
	attr_reader :grid

	# factory method
	def self.start_chess
		board = self.new
		8.times do |c|
			# (board, color, location)
			board[[1, c]] = Pawn.new(board, :black, [1, c])
			board[[6, c]] = Pawn.new(board, :white, [6, c])
		end

		[ Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook].
			each_with_index do |piece_klass, column|
				[[0, :black], [7, :white]].each do |(row, color)|
					location = [row, column]
					board[location] = piece_klass.new(
						board,
						color,
						location
					)
				end
			end

		board
	end

	def initialize
		# create an array of 8 empty arrays
		@grid = Array.new(8) { Array.new(8, NullPiece.instance) }
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

	def empty?(location)
		row, column = location
		grid[row][column] == NullPiece.instance
	end

	def in_check?(color)
		# determine king position
		king = pieces.find {|p| p.color == color && p.is_a?(King)}

		if king.nil?
			raise "No king found."
		end

		king_position = king.location
		# loop over all pieces of the opposite color
		opposite_color_pieces = pieces.select { |p| p.color != color }

		opposite_color_pieces.each do |piece|
			# if any piece has an available move with the king of the
			# color's position, then color is in check
			if piece.available_moves.include?(king_position)
				return true
			end
		end

		false
	end

	def checkmate?(color)
		return false if !in_check?(color)

		color_pieces = pieces.select {|p| p.color == color}

		color_pieces.any? { |piece| piece.safe_moves.empty? }

	end

	def pieces
		grid.flatten.reject { |piece| piece.is_a?(NullPiece) }
	end

	def move_piece(start_position, end_position)
		# validate that end pos is in safe moves
		piece = self[start_position]
		if !piece.safe_moves.include?(end_position)
			raise InvalidMoveError.new(
				"End position (#{end_position}) not in available moves: #{piece.safe_moves}"
			)
		end

		if !in_bounds?(end_position)
			raise InvalidMoveError.new(
				'End position not in bounds'
			)
		end

		move_piece!(start_position, end_position)
	end

	def move_piece!(start_position, end_position)
		# remove piece from current location
		# place piece on board at new location
		self[start_position], self[end_position] = NullPiece.instance, self[start_position]
		# update piece's internal location with end position
		self[end_position].location = end_position
	end

	def deep_duplicate
		new_board = Board.new
		pieces.each do |piece|
			new_piece = piece.class.new(new_board, piece.color, piece.location)
			new_board[new_piece.location] = new_piece
		end

		new_board
	end
end
