class Board

	# allow read  && write
	attr_accessor :board_table

	#Create an empty array as a board
	def initialize
		@board_table = Array.new(9,"-")
	end

		
	def setPosition(player, position)
		board_table[position] = player.mark
		return board_table
	end


	def getPosition(position)
		return board_table[position]
	end	

	#Method to print board on screen
	def printBoard()
		puts"---------"
		puts"0 #{board_table[0]}|#{board_table[1]}|#{board_table[2]}"
		puts"1 #{board_table[3]}|#{board_table[4]}|#{board_table[5]}"
		puts"2 #{board_table[6]}|#{board_table[7]}|#{board_table[8]}"
		puts"  0 1 2"
		puts"--------"

	end

    
    #Check for a winner
	def check_winner(player)
		 # print board_table

		 win_lines = [[board_table[0],board_table[1],board_table[2]],
		 			[board_table[3],board_table[4],board_table[5]],
		 			[board_table[6],board_table[7],board_table[8]],
		 			[board_table[0],board_table[3],board_table[6]],
		 			[board_table[1],board_table[4],board_table[7]],
					[board_table[2],board_table[5],board_table[8]],	
					[board_table[0],board_table[4],board_table[8]],
					[board_table[2],board_table[4],board_table[6]]]

		 	 win_lines.each do |winning_line|
                if winning_line.count(player.mark) == 3
                	return true
                end
         	 end
        return false
    end


	#Check if its position available
	def anyMoveLeft?()
		if board_table.include?("-")
			return true
		else
			return false
		end

	end

	def getIndexat(position)
		return board_table[position]	
	end

	def getBoard()
		return board_table
	end

	#show results
	def results(board,player1,player2)
		if board.check_winner(player1) == true
			finalResult = "Player1 won"
		elsif board.check_winner(player2) == true
			finalResult = "Player2 won"
		else
			finalResult = "We have a draw"
		end
	return finalResult
	end
end