class Player
	attr_reader :color

	def initialize(color)
		@color = color
	end

	def get_position
		#get input, remove new lines and white space, 
		# split on comma, map to integers, return coordinates
		gets.chomp.split(",").map { |part| part.to_i }
	end
end