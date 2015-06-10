require 'yaml'

class Hangman
	def initialize(dictionary)
		@gameover = false
		@wrong_guesses = 0
		@dictionary = dictionary
		@letters_guessed = []
		@current_word = ""
		@word = get_word
		@view = get_view("hangman_display.txt")
	end

	def game_loop
		while !@gameover
			print_status
			guess = get_input
			guess.upcase == "SOLVE" ? solve_attempt : determine_outcome
			@gameover = is_gameover
			save_game
		end
		if @wrong_guesses >=6
			puts "\n\n======================================="
			puts "============== You lose! =============="
			puts "======================================="
		else
			puts "\n\n======================================="
			puts "====== Congratulations, you win! ======"
			puts "======================================="
		end
	end

	def get_word
		words = []
		chosen_word = ""

		file = File.open(@dictionary).each {|word|
			words << word
		}
		file.close

		loop do
			chosen_word = words[rand(words.length)]
			break if chosen_word.length > 5 && chosen_word.length <= 13
		end

		(chosen_word.length-1).times{@current_word += "*"}

		return chosen_word.upcase
	end

	def get_view(file)
		view = []
		counter = 0
		current_view = ""
		file = File.open(file).each {|line|
			if counter < 7
				current_view += line
				counter += 1
			else 
				current_view += line
				view << current_view
				current_view = "" 
				counter = 0
			end
		}
		file.close

		return view
	end

	def print_status
		puts "\nThe current word is: #{@current_word}\n"
		puts @view[@wrong_guesses]
		puts "\nLetters you have guessed: #{@letters_guessed.join(", ")}"
		puts "You have #{6-@wrong_guesses} lives left"
	end

	def get_input
		guess = ""
		loop do
			print "Guess a letter or type 'solve' to solve: "
			guess = gets.chomp
			valid_guess = is_valid(guess)
			break if valid_guess
		end
		return guess
	end

	def is_valid(guess)
		if guess.upcase == "SOLVE"
			return true
		elsif @letters_guessed.include?(guess.upcase)
			return false
		elsif guess.length != 1
			return false
		elsif guess.match(/^[[:alpha:]]$/)
			@letters_guessed << guess.upcase
			return true
		else 
			return false
		end
	end

	def determine_outcome
		if @word.include?(@letters_guessed[-1]) 
			for i in 0..@word.length-1
				if @letters_guessed[-1] == @word[i]
					@current_word[i] = @word[i]
				end
			end
		else
			@wrong_guesses += 1 
		end
	end

	def is_gameover
		if @wrong_guesses >= 6
			@gameover = true
		else
			for i in 0..@current_word.length
				if @current_word[i] == "*"
					return false
				end
			end
		end
		return true
	end

	def solve_attempt
		print "Enter the solution to the word: "
		attempt = gets.chomp.upcase
		if attempt == @word[0..@word.length-2]
			@gameover = true
			@current_word = @word
			puts "You guessed the word correctly!"
		else
			@wrong_guesses += 1
			puts "Sorry, that's incorrect!"
		end
	end
end


def load_game
	if File.exists?("saves/save_file.yaml")
		content = File.open("saves/save_file.yaml", "r") { |file| file.read }
		YAML.load(content) 
	else
		puts "ERROR! There is no save file!"
	end
end

def save_game
	Dir.mkdir("saves") unless Dir.exist? "saves"
	filename = "saves/save_file.yaml"
	File.open(filename, "w") do |file|
		file.puts YAML.dump(self)
	end
end


#Initial setup
to_load = ""
loop do
	print "Do you want to load the game (Y/N): "
	to_load = gets.chomp
	break if to_load.upcase == "Y" || to_load.upcase == "N"
	puts "Incorrect input!"
end

game = to_load.upcase == "Y" ? load_game : Hangman.new("dictionary.txt")
game.game_loop if File.exists?("saves/save_file.yaml") || to_load.upcase == "N"