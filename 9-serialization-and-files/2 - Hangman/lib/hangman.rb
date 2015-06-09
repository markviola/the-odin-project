class Hangman
	def initialize
		@gameover = false
		@words = get_words

	end

	def setup

	end

	def game_loop
		while !@gameover

		end
	end

	def get_words
		file = File.open("../dictionary.txt",'r')

		file.close
	end
end

