class Game

	attr_reader :player1, :player2
	attr_accessor :current_player

	def initialize
		@player1 = Player.new(:black)
		@player2 = Player.new(:white)
		@current_player = @player1
		# need board, board renderer, players
	end

	def swap_player!
		self.current_player = (current_player == player1 ? player2 : player1)
	end

	def play
		puts "It's #{current_player.color}'s turn"
		# enter starting position
		# enter an ending position
		# move peice
	end
end