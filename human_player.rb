class Human_player

	attr_accessor :mark#, :id

	#Human or Computer
	def initialize(mark)
		@mark = mark
		#@id = id
	end

	

	def positionAvailable?(board,position)
		if board[position] == "-"
			return true
		else
			return false
		end
	end
end 