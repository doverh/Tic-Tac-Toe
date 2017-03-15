require 'sinatra'
require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'game.rb'
require_relative 'random_player.rb'
require_relative 'sequential_player.rb'
require_relative 'unbeatable_player.rb'


enable 'sessions'

get '/' do
	
	erb:ttt_board

end

 #Select level to create players
 post '/getLevel' do
 	 session[:player2] = params["level"]
 	 session[:board] = Board.new
 	 erb:ttt_board, :locals => {:player2=>session[:player2], :board=>session[:board]}
end

 
 #Create players
 get '/getMove' do
     player1 = Human_player.new('X') 
     board_table = session[:board]
     player2 = session[:player2]
     

     #Create an object depending on what user selected
     if player2 == "Random_player"
     	player2 = Random_player.new("O")
     elsif player2 == "Sequential_player"
     	player2 = Sequential_player.new("O")
     else 
     	player2 = Unbeatable_player.new("O")
     end
     # # @result = ""
     # puts "#{show_board}"
     loop do 
			#call the method set position returning player and position
			board_table.printBoard()
			print "Set a position"
  			position = gets.to_i
			# position = player1.getMove(board_table.getBoard())
				while player1.positionAvailable?(board_table.getBoard(),position) == false
				print "Set a position"
     			position = gets.to_i     		
     		end
			board_table.setPosition(player1,position)
			show_board = board_table.getBoard()
			
			break if  board_table.anyMoveLeft?() == false || board_table.check_winner(player1) == true
			position1 = player2.getMove(board_table.getBoard())
			while player2.positionAvailable?(board_table.getBoard(),position1) == false
     			position1 = player2.getMove(board_table.getBoard())
     		end	
			board_table.setPosition(player2,position1)
			show_board = board_table.getBoard()
			break if  board_table.anyMoveLeft?() == false || board_table.check_winner(player2) == true
		end
		result  = board_table.results(board_table,player1,player2)
	 erb:ttt_board, :locals => {:board_table=>params[:board_table],:result=>params[:result],:show_board=> show_board }
	
	
	end




	
	
