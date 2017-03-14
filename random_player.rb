class Random_player

	 attr_accessor :mark

	 def initialize(mark)
	 	@mark = mark
	 end

	def getMove(board)
		position = Random.rand(0..8)
		while positionAvailable?(board,position)== false
				position = Random.rand(0..8)
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
end





