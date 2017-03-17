require 'sinatra'
require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'game.rb'
require_relative 'random_player.rb'
require_relative 'sequential_player.rb'
require_relative 'unbeatable_player.rb'


enable 'sessions'

get '/' do
	session[:board] = Board.new
	erb:ttt_board, :locals => {:board=>session[:board]}

end

 #Select level to create players
 post '/getLevel' do
 	session[:board] = Board.new
 	 session[:player2] = params["level"]
 	 erb:ttt_board, :locals => {:player2=>session[:player2], :board=>session[:board]}
end

 
 #Create players
 post '/getMove' do
     player1 = Human_player.new('X') 
     board_table = session[:board]
     player2 = session[:player2]
     if params["position"][0].to_i == 0
     	position = 0
     elsif params["position"][0].to_i == 1
     	position = 1
     elsif params["position"][0].to_i == 2
     	position = 2
     elsif params["position"][0].to_i ==3
     	position = 3
     elsif params["position"][0].to_i == 4
     	position = 4
     elsif params["position"][0].to_i == 5
     	position = 5
     elsif params["position"][0].to_i == 6
     	position = 6
     elsif params["position"][0].to_i == 7
     	position = 7	
    else position = 8
    end 
     	

 	 # position = params["position1"].to_i
 	 # position = params["position2"].to_i
 	 # position = params["position3"].to_i
 	 # position = params["position4"].to_i
 	 # position = params["position5"].to_i
 	 # position = params["position6"].to_i
   #   position = params["position7"].to_i
 	 # position = params["position8"].to_i
   #   #Create an object depending on what user selected
     if player2 == "Random_player"
     	player2 = Random_player.new("O")
     elsif player2 == "Sequential_player"
     	player2 = Sequential_player.new("O")
     else 
     	player2 = Unbeatable_player.new("O")
     end
     puts "position #{position}"

    # loop do 
    	# || board_table.check_winner(player1) == false || board_table.check_winner(player2) == false

	if player1.positionAvailable?(board_table.getBoard(),position) == true
				board_table.setPosition(player1,position)
		if board_table.check_winner(player1) == true ||  board_table.anyMoveLeft?() == false
			session[:result]  = board_table.results(board_table,player1,player2)
			 puts "Result #{session[:result]}"
		end
		
		if  board_table.anyMoveLeft?() == true
			position1 = player2.getMove(board_table.getBoard())
			if player2.positionAvailable?(board_table.getBoard(),position1) == true
  		   		board_table.setPosition(player2,position1)
 	 		end
 	 		if board_table.check_winner(player2) == true ||  board_table.anyMoveLeft?() == false
				session[:result]  = board_table.results(board_table,player1,player2)
			end
		end
		session[:result]  = board_table.results(board_table,player1,player2)
	end	
		
	 erb:ttt_board, :locals => {:board_table=>params[:board_table], :result=>session[:result]}
	
	
	end




	
	
