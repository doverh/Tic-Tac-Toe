class Game

	# allow read  && write
	attr_accessor :player1,:player2	,:board_table,:aiLevel 

def initialize(player1,player2)
	@player1=player1.new("X")
	@player2=player2.new("O")
	@board_table = Board.new
end
	
	#print the movement in the board
	def play()
	   
		loop do 
			#call the method set position returning player and position
			board_table.printBoard()
			position = player1.getMove(board_table.getBoard())
			board_table.setPosition(player1,position)
			break if  board_table.anyMoveLeft?() == false || board_table.check_winner(player1) == true

			position = player2.getMove(board_table.getBoard())
			board_table.setPosition(player2,position)
			break if  board_table.anyMoveLeft?() == false || board_table.check_winner(player2) == true
		end
		board_table.printBoard()
		return results()
	end


	#show results
	def results()
		if board_table.check_winner(player1) == true
			finalResult = "Player1 won"
		elsif board_table.check_winner(player2) == true
			finalResult = "Player2 won"
		else
			finalResult = "We have a draw"
		end
		puts finalResult
	return finalResult
	end
end