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
 
 post '/getMove' do

     #CREATE PLAYERS AND BOARD
     player1 = Human_player.new('X') 
     board_table = session[:board]
     player2 = session[:player2]


    # Create an object depending on what user selected
     if player2 == "Random_player"
        player2 = Random_player.new("O")
     elsif player2 == "Sequential_player"
        player2 = Sequential_player.new("O")
     else 
        player2 = Unbeatable_player.new("O")
     end

     #GET THE POSITION CHOOSE BY THE PLAYER WHEN THIS PRESS A BUTTON
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
     	
    #CALL THE APPROPPRIATE METHODS TO PLAY THE GAME
	
    #PLAYER 1 PLAY IF ANY MOVE LEFT AND NO RESULTS AVAILABLE
    if player1.positionAvailable?(board_table.getBoard(),position) == true && board_table.results(board_table,player1,player2) == ""
				board_table.setPosition(player1,position)
		#CHECK IF PLAYER 1 WON
        if board_table.check_winner(player1) == true || board_table.anyMoveLeft?() == false
			session[:result]  = board_table.results(board_table,player1,player2)
            #ADD VICTORY TO PLAYER 1
            session[:playerWin] = session[:playerWin] +1
            board_table.finishBoard     
		end

    	#PLAYER 2 PLAY IF ANY MOVE LEFT AND NO RESULTS AVAILABLE
		if  board_table.anyMoveLeft?() == true && board_table.results(board_table,player1,player2) == ""
			position1 = player2.getMove(board_table.getBoard())
			if player2.positionAvailable?(board_table.getBoard(),position1) == true
  		   		board_table.setPosition(player2,position1)
 	 		end
            #CHECK IF PLAYER 2 WON
 	 		if board_table.check_winner(player2) == true ||  board_table.anyMoveLeft?() == false
				session[:result]  = board_table.results(board_table,player1,player2)
                session[:computerWin] = session[:computerWin] +1
                board_table.finishBoard
            end
        end
		    #Get the final result of the game
            session[:result]  = board_table.results(board_table,player1,player2)

	end	


	 erb:ttt_board, :locals => {:board_table=>params[:board_table], :result=>session[:result], :playerWin=>session[:playerWin], :computerWin=>session[:computerWin]}
	
	
	end




	
	
