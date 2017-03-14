require 'minitest/autorun'
require_relative '../board.rb'
require_relative '../player.rb'
require_relative '../game.rb'
require_relative '../random.rb'




class TestRandom < Minitest::Test
	#test when playing again RandomAI 
	def test_game_Random_level

		game = Game.new(Random)
		assert_equal("Player1 won", game.play())
	end

end


