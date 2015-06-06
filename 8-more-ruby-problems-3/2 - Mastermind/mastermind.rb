class Mastermind
	colors = ['orange', 'green', 'red', 'blue', 'purple', 'yellow']
	clue = ['none', 'none', 'none', 'none']

	def initialize
		@gameover = false
		setup
		game_loop
	end

	def setup
		print "Enter your name: "
		@name = gets.chomp
	end

	def game_loop
		while !@gameover
			get_input
		end
	end

	def get_input
		prints "Enter your guess (O/G/R/B/P/Y separated by commas): "
		guess = gets.chomp
		
	end	
end