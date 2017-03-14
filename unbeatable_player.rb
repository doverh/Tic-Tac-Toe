class Unbeatable_player

	 attr_accessor :mark

	 def initialize(mark)
	 	@mark = mark
	 end

	 def getMove(board)

	 	#Identify unbetable mark and player mark
	 	cpu_mark = mark
		
		if cpu_mark == "X"
			player_mark = "O"
		else
			player_mark = "X"
		end

		
	 	if check_for_win_or_block(board,cpu_mark) < 9
	 		position = check_for_win_or_block(board,cpu_mark)
	 		while positionAvailable?(board,position) == false
	 			position = check_for_win(board,cpu_mark)
				# return position
			end
		elsif check_for_win_or_block(board,player_mark) < 9
	 		position = check_for_win_or_block(board,player_mark)
	 		while positionAvailable?(board,position) == false
	 			position = check_for_win(board,cpu_mark)
				# return position
		end
		#Avoid a fork by forcing an attack
		elsif board[4] == cpu_mark
			position = block_fork()
				while positionAvailable?(board,position)== false
				position = board.index("-")
				end
		
		elsif board[4] == player_mark
			position = check_opponent_has_center()
				while positionAvailable?(board,position)== false
				position = board.index("-")
				end

		elsif board[0] == player_mark || board[1] == player_mark || board[2] == player_mark || board[3] == player_mark || board[5] == player_mark || board[6]== player_mark || board[7]== player_mark || board[8] == player_mark  
			position = chech_first_corner_edge()
				while positionAvailable?(board,position)== false
				position = board.index("-")
				end
		else
			position = board.index("-")
			while positionAvailable?(board,position)== false
				position = board.index("-")
		end
	end
     	 return position
 
	end


	
		#Return true or false if possition is available
	def positionAvailable?(board,position)
		if board[position] == "-"
			return true
		else
			return false
		end
	end

	#
	def check_opponent_has_center()
			position = 2
		return position
	end

	#Check if player has a corner or edge
	def chech_first_corner_edge()
		position = 4
		return position
	end	

	#This method avoid fork by attacking forcing the opponent to block in the next move
	def	block_fork()
		position = 1
		return position
	end
		

    #This method check if a win is possible
	def check_for_win_or_block(board_table,player_mark)
		#Test for an win in the first line


		win_block_lines = 
					[[board_table[0],board_table[1],board_table[2]],
		 			[board_table[3],board_table[4],board_table[5]],
		 			[board_table[6],board_table[7],board_table[8]],
		 			[board_table[0],board_table[3],board_table[6]],
		 			[board_table[1],board_table[4],board_table[7]],
					[board_table[2],board_table[5],board_table[8]],	
					[board_table[0],board_table[4],board_table[8]],
					[board_table[2],board_table[4],board_table[6]]]

	   win_or_block_positions = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
			

			position = 9		
			 win_block_lines.each_with_index do |winning_line, index|
                if winning_line.count(player_mark) == 2 && winning_line.count("-") == 1
                	win_or_block = winning_line.index("-")	
                	position = win_or_block_positions[index][win_or_block]
                end
             end
         	 return position
         end	
end
