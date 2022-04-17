class BoardRendererText
	attr_reader :board
	def initialize(board)
		@board = board
	end

	def render
		8.times do |r|
			puts "------------"
			8.times do |c|
				print board[[r, c]]
			end
			puts ""
		end
	end
end