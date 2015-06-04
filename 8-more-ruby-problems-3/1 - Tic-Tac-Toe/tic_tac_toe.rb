class TicTacToe
	def initialize
		@gameover = false
		@board = [[' ', ' ', ' '], [' ', ' ', ' '], [' ', ' ', ' ']]
		@turn_count = 0
		game_loop
	end

	def set_up
		print "Enter the name for Player 1: "
		input_name = gets.chomp
		print "Enter a symbol to use: "
		input_symbol = gets.chomp
		print "Enter the name for Player 2: "
		input_name2 = gets.chomp
		print "Enter a symbol to use: "
		input_symbol2 = gets.chomp
		@player1 = Player.new(input_name, input_symbol)
		@player2 = Player.new(input_name2, input_symbol2)
		@current_player = @player1
		draw_board
	end

	def game_loop
		set_up
		while !@gameover
			valid_move = false
			player_input = []
			loop do 
				print @current_player.name.to_s
				print ', enter a location: '
				player_input = gets.chomp.split(",")
				valid_move = is_valid(player_input[0].to_i, player_input[1].to_i)
				break if valid_move == true
				puts "Invalid move!"
			end
			@turn_count += 1
			@board[player_input[1].to_i][player_input[0].to_i] = @current_player.symbol
			check_gameover
			change_player
			draw_board
		end
		if @turn_count > 9
			puts "It's a tie game!"
		elsif @current_player == @player1
			puts @player2.name.to_s + ' wins!'
		elsif @current_player == @player2
			puts @player1.name.to_s + ' wins!'
		else
			puts "ERROR!"
		end
	end

	def draw_board
		puts '-------'
		for i in 0...3
			for j in 0...3
				print '|' + @board[i][j].to_s
			end
			puts '|'
			puts '-------'
		end
	end

	def change_player
		if @current_player == @player1
			@current_player = @player2
		else
			@current_player = @player1
		end
	end

	def is_valid(x_coord, y_coord)
		if (x_coord >= 0 && x_coord <=2) && (y_coord >= 0 && y_coord <=2)
			if @board[y_coord][x_coord] == ' '
				return true
			else 
				return false
			end
		end
		return false
	end

	def check_gameover
		check = @current_player.symbol
		if @board[0][0] == check && @board[0][1] == check && @board[0][2] == check
			@gameover = true
		elsif @board[1][0] == check && @board[1][1] == check && @board[1][2] == check
			@gameover = true
		elsif @board[2][0] == check && @board[2][1] == check && @board[2][2] == check
			@gameover = true
		elsif @board[0][0] == check && @board[1][0] == check && @board[2][0] == check
			@gameover = true
		elsif @board[0][1] == check && @board[1][1] == check && @board[2][1] == check
			@gameover = true
		elsif @board[0][2] == check && @board[1][2] == check && @board[2][2] == check
			@gameover = true
		elsif @board[0][0] == check && @board[1][1] == check && @board[2][2] == check
			@gameover = true
		elsif @board[2][0] == check && @board[1][1] == check && @board[0][2] == check
			@gameover = true
		elsif @turn_count > 9
			@gameover = true
		end
	end
end

class Player
	def initialize(name, symbol)
		@name = name.to_sym
		@symbol = symbol.to_sym
	end

	def name
		return @name
	end

	def symbol
		return @symbol
	end
end

game = TicTacToe.new