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

 post '/getLevel' do
 	 session[:player1] = "Human_player"
 	 session[:player2] = params["level"]
 	 # res =  calc_change(coin.to_f)
	 # session[:results] = res.assoc("quarters")		 
	 # teste = res.assoc("quarters")
	 erb:ttt_board, :locals => {:player1=>session[:player1], :player2=>session[:player2]}
end

 get '/getLevel' do
     player1 = session[:player1]
     player2 = session[:player2]
 	 board = Board.new
	  
 	 while board.anyMoveLeft?()
     	position1 = player1.getMove(board)
     	#send position1 to the interface
     	position2 = player2.getMove(board)
    	 #send position1 to the interface
     end
     erb:ttt_board, :locals => {:board=>board}
	
end

	
	
