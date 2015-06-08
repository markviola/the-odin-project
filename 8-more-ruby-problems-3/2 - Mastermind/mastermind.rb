class Mastermind
	def initialize
		@gameover = false
		@turn_num = 1
		@answer = []
		@guess = []
		@colors = ['O', 'G', 'R', 'B', 'P', 'Y']
		@answer_num = {'O'=>0, 'G'=>0, 'R'=>0, 'B'=>0, 'P'=>0, 'Y'=>0}
		@guess_num = {'O'=>0, 'G'=>0, 'R'=>0, 'B'=>0, 'P'=>0, 'Y'=>0}
		#black = correct color + position, white = correct color
		@clue = {'black'=>0, 'white'=>0, 'none'=>0} 
		setup
		game_loop
	end

	def setup
		print "Enter your name: "
		@name = gets.chomp
		#Setting up answer key
		for i in 0...4
			color = @colors[rand(6)]
			@answer << color
			@answer_num[color] += 1
		end
	end

	def game_loop
		while !@gameover
			get_input
			check_guess
			print_results
			@turn_num += 1
			@gameover = true if @turn_num > 14 #Maximum number of turns is 14
		end
		if @turn_num > 14
			puts "Sorry, #{@name}, you lost!"
		else
			puts "Congratulations, #{@name}! You cracked the code in #{@turn_num-2} turns."
		end
	end

	def get_input
		loop do
			print "Enter your guess (O/G/R/B/P/Y separated by commas): "
			@guess = gets.chomp.split(",")
			break if valid_guess
			puts "Invalid guess!"
		end
	end

	def valid_guess
		if @guess.length === 4
			for i in 0...@guess.length
				return false if !@colors.include?(@guess[i])
			end
			#Reset guess counter
			@guess_num = {'O'=>0, 'G'=>0, 'R'=>0, 'B'=>0, 'P'=>0, 'Y'=>0}
			for i in 0...4
				@guess_num[@guess[i]] += 1
			end
			#All elements of @guess are valid
			return true
		else
			return false
		end
	end

	def check_guess
		#Assuming @guess variable has 4 elements because of valid_guess

		if @guess_num == @answers_num
			@clue['black'] = 4
			@gameover = true
		else
			@clue['black'] = 0
			for i in 0...4
				if @answer[i] == @guess[i]
					@clue['black'] += 1
				end
			end
			#Find the total number of correct colors found
			correct_colors = 0
			@answer_num.each do |color, num|
				if @guess_num[color] > num
					correct_colors += num
				elsif num >= @guess_num[color] 
					correct_colors += @guess_num[color]
				end
			end
			#Correct colors guessed = correct positions + incorrect positions
			@clue['white'] = correct_colors - @clue['black']
		end	
	end

	def print_results
		puts "Your guess was: #{@guess[0]},#{@guess[1]},#{@guess[2]},#{@guess[3]}"
		puts "You have #{14 - @turn_num} turns left"
		puts "#{@clue['black']} were the correct color in the correct location"
		puts "#{@clue['white']} were the correct color in the wrong location"
		puts ""
	end
end

game = Mastermind.new