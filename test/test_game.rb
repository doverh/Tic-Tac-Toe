require 'minitest/autorun'
require_relative '../board.rb'
require_relative '../human_player.rb'
require_relative '../game.rb'
require_relative '../random_player.rb'
require_relative '../sequential_player.rb'
require_relative '../unbeatable_player.rb'




class TestGame < Minitest::Test

	#test when playing again RandomAI 
	def test_game_Random_level
		game = Game.new(Unbeatable_player,Random_player)
		assert_equal("Player1 won", game.play())
	end

	def test_game_Sequential_Unbeatable
		game = Game.new(Sequential_player,Unbeatable_player)
		assert_equal("Player2 won", game.play())
	end

	def test_game_Human_Unbeatable_player
		game = Game.new(Human_player,Unbeatable_player)
		assert_equal("We have a draw", game.play())
	end


	def test_game_Unbeatable_player
		game = Game.new(Unbeatable_player,Unbeatable_player)
		assert_equal("We have a draw", game.play())
	end



end

	
