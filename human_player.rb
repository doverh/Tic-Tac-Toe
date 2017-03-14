class Human_player

	attr_accessor :mark#, :id

	#Human or Computer
	def initialize(mark)
		@mark = mark
		#@id = id
	end

	def getMove(board)
			
	#Check if position is available and set a position
			puts "Chose x position!"  
			x = gets.to_i 
			puts "Chose y position!"  
			y = gets.to_i 
			position = x*3+y 
			while positionAvailable?(board,position) == false
				puts "This position is not available!"
				puts "Chose x position!"  
				x = gets.to_i 
				puts "Chose y position!"  
				y = gets.to_i
				position = x*3+y 
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