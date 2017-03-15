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
 	 # res =  calc_change(coin.to_f)
	 # session[:results] = res.assoc("quarters")		 
	 # teste = res.assoc("quarters")
	 erb:ttt_board, :locals => {:player2=>session[:player2]}
end

 
 #Create players
 get '/getMove' do
     player1 = Human_player.new('X') 
     board_table = Board.new
     session[:board_table] = board_table.getBoard()
     player2 = session[:player2]
     if player2 == "Random_player"
     	player2 = Random_player.new("O")
     elsif player2 == "Sequential_player"
     	player2 = Sequential_player.new("O")
     else 
     	player2 = Unbeatable_player.new("O")
     end
     @result = ""

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
			break if  board_table.anyMoveLeft?() == false || board_table.check_winner(player1) == true
			position1 = player2.getMove(board_table.getBoard())
			while player2.positionAvailable?(board_table.getBoard(),position1) == false
     			position1 = player2.getMove(board_table.getBoard())
     		end	
			board_table.setPosition(player2,position1)
			break if  board_table.anyMoveLeft?() == false || board_table.check_winner(player2) == true
		end
		@result  = board_table.results(board_table,player1,player2)

     erb:ttt_board, :locals => {:board_table=>params[:board_table],:result=>params[:result] }
	
	
	end




	
	
