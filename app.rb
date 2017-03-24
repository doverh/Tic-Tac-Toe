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
     	
    #Variables to count the number of victories
    session[:playerWin] = 0
    session[:computerWin] = 0    
    
    # Create an object depending on what user selected
     if player2 == "Random_player"
     	player2 = Random_player.new("O")
     elsif player2 == "Sequential_player"
     	player2 = Sequential_player.new("O")
     else 
     	player2 = Unbeatable_player.new("O")
     end
     puts "position #{position}"

   
	if player1.positionAvailable?(board_table.getBoard(),position) == true
				board_table.setPosition(player1,position)
		if board_table.check_winner(player1) == true || board_table.anyMoveLeft?() == false
			session[:result]  = board_table.results(board_table,player1,player2)     
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

	
    if board_table.anyMoveLeft?() == false
        if board_table.results(board_table,player1,player2) == "Player1 won!"
            session[:playerWin] = session[:playerWin] +1
        elsif board_table.results(board_table,player1,player2) == "Computer won!"
            session[:computerWin] = session[:computerWin] +1
        end
    end    

	 erb:ttt_board, :locals => {:board_table=>params[:board_table], :result=>session[:result], :playerWin=>session[:playerWin], :computerWin=>session[:computerWin]}
	
	
	end




	
	
