require 'minitest/autorun'
require_relative '../board.rb'
require_relative '../player.rb'
require_relative '../game.rb'
require_relative '../sequential.rb'



class TestSequential < Minitest::Test
	def test_game_intermediate_level
		game = Game.new(Intermediate)
		assert_equal("Player1 won", game.play())
	end

end