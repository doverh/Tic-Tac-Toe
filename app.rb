require 'sinatra'
require_relative 'board.rb'
require_relative 'human_player.rb'
require_relative 'game.rb'
require_relative 'random_player.rb'
require_relative 'sequential_player.rb'
require_relative 'Unbeatable_player_player.rb'


enable 'sessions'

get '/' do
	
	erb:ttt_main

end

 post '/getLevel' do
 	 session[:player1] = "Human_player"
 	 session[:player2] = params["level"]
 	 session[:results] = play(player1,player2)
	 # res =  calc_change(coin.to_f)
	 # session[:results] = res.assoc("quarters")		 
	 # teste = res.assoc("quarters")
	 erb:ttt_main, :locals => {:results=>session[:results]}

end
 	
	
