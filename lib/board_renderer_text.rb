class BoardRendererText
	attr_reader :board
	def initialize(board)
		@board = board
	end

	def render
		8.times do |r|
			puts "---------------"
			8.times do |c|
				piece = board[[r, c]]
				if piece.nil?
					print "  "
				else
					print "#{board[[r, c]]} "
				end
			end
			puts ""
		end
		puts "---------------"
	end
end