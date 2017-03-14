class Sequential_player

	attr_accessor :mark

	 def initialize(mark)
	 	@mark = mark
	 end

	def getMove(board)
	
		position = getNextAvailablePosition(board)
		while positionAvailable?(board,position) == false
				position = getNextAvailablePosition(board)
		end
		return position
	end


	def positionAvailable?(board,position)
		if board[position] == "-"
			return true
		else
			return false
		end
	end


	def getNextAvailablePosition(board)
		position = board.index("-")
	end


end