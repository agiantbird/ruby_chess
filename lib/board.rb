require_relative './bishop.rb'
require_relative './king.rb'
require_relative './knight.rb'
require_relative './pawn.rb'
require_relative './queen.rb'
require_relative './rook.rb'
require_relative './piece.rb'

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

		[[0, :black], [7, :white]].each do |(r, color)|
			board[[r, 0]] = Rook.new(board, color, [r, 0])
			board[[r, 7]] = Rook.new(board, color, [r, 7])
			board[[r, 1]] = Knight.new(board, color, [r, 1])
			board[[r, 6]] = Knight.new(board, color, [r, 6])
			board[[r, 2]] = Bishop.new(board, color, [r, 2])
			board[[r, 5]] = Bishop.new(board, color, [r, 5])
		end

		board[[0, 3]] = Queen.new(board, :black, [0, 3])
		board[[0, 4]] = King.new(board, :black, [0, 4])
		board[[7, 3]] = Queen.new(board, :white, [7, 3])
		board[[7, 4]] = King.new(board, :white, [7, 4])

		# make sure to return the actual instance
		board
	end

	def initialize
		# create an array of 8 empty arrays
		@grid = Array.new(8) { Array.new(8) }
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
		grid[row][column].nil?
	end

	def in_check?(color)
		# determine king position
		king_position = pieces.find {|p| p.color == color && p.is_a?(King)}.location
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

	def pieces
		grid.flatten.reject { |piece| piece.nil? }
	end

	def move_piece(start_position, end_position)
		# validate that end pos is in available moves
		piece = self[start_position]
		if !piece.available_moves.include?(end_position)
			raise InvalidMoveError.new(
				"End position (#{end_position}) not in available moves: #{piece.available_moves}"
			)
		end

		if !in_bounds?(end_position)
			raise InvalidMoveError.new(
				'End position not in bounds'
			)
		end
		# remove piece from current location
		self[start_position] = nil
		# place piece on board at new location
		self[end_position] = piece
		# update piece's internal location with end position
		piece.location = end_position
	end


end







