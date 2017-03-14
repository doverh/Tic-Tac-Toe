require 'minitest/autorun'
require_relative '../board.rb'
require_relative '../human_player.rb'
require_relative '../game.rb'
require_relative '../random_player.rb'
require_relative '../sequential_player.rb'
require_relative '../unbeatable_player.rb'




class TestUnbeatable < Minitest::Test
	
	# def test_win_new_Player_return_2_line_1
	# 	player = Unbeatable_player.new("O")
	# 	board = ["O","O","-","-","-","-","-","-","-"]
	# 	assert_equal(2,player.getMove(board))
	# end

	# def test_win_new_Player_return_1_line_1
	# 	player = Unbeatable_player.new("O")
	# 	board = ["O","-","O","-","-","-","-","-","-"]
	# 	assert_equal(1,player.getMove(board))
	# end

	# def test_win_new_Player_return_0_line_1
	# 	player = Unbeatable_player.new("O")
	# 	board = ["-","O","O","-","-","-","-","-","-"]
	# 	assert_equal(0,player.getMove(board))
	# end

	# def test_win_new_Player_return_5_line_2
	# 	player = Unbeatable_player.new(2)
	# 	board = [0,0,0,2,2,0,0,0,0]
	# 	assert_equal(5,player.getMove(board))
	# end

	# def test_win_new_Player_return_4_line_2
	# 	player = Unbeatable_player.new(2)
	# 	board = [0,0,0,2,0,2,0,0,0]
	# 	assert_equal(4,player.getMove(board))
	# end

	# def test_win_new_Player_return_3_line_2
	# 	player = Unbeatable_player.new(2)
	# 	board = [0,0,0,0,2,2,0,0,0]
	# 	assert_equal(3,player.getMove(board))
	# end

	# def test_win_new_Player_return_6_line_3
	# 	player = Unbeatable_player.new(2)
	# 	board = [0,0,0,0,0,0,0,2,2]
	# 	assert_equal(6,player.getMove(board))
	# end

	# def test_win_new_Player_return_7_line_3
	# 	player = Unbeatable_player.new(2)
	# 	board = [0,0,0,0,0,0,2,0,2]
	# 	assert_equal(7,player.getMove(board))
	# end

	# def test_win_new_Player_return_8_line_3
	# 	player = Unbeatable_player.new(2)
	# 	board = [0,0,0,0,0,0,2,2,0]
	# 	assert_equal(8,player.getMove(board))
	# end

	# def test_win_new_Player_return_6_column_1
	# 	player = Unbeatable_player.new(2)
	# 	board = [2,0,0,2,0,0,0,0,0]
	# 	assert_equal(6,player.getMove(board))
	# end

	# def test_win_new_Player_return_4_column_2
	# 	player = Unbeatable_player.new(2)
	# 	board = [0,2,0,0,0,0,0,2,0]
	# 	assert_equal(4,player.getMove(board))
	# end

	# def test_win_new_Player_return_5_column_3
	# 	player = Unbeatable_player.new(2)
	# 	board = [0,0,2,0,0,0,0,0,2]
	# 	assert_equal(5,player.getMove(board))
	# end


	# def test_win_new_Player_return_8_diagonal_1
	# 	player = Unbeatable_player.new(2)
	# 	board = [2,0,0,0,2,0,0,0,0]
	# 	assert_equal(8,player.getMove(board))
	# end


	# def test_win_new_Player_return_2_diagonal_2
	# 	player = Unbeatable_player.new(2)
	# 	board = [0,0,0,0,2,0,2,0,0]
	# 	assert_equal(2,player.getMove(board))
	# end

	def test_win_new_Player_return_8_diagonal_1
		player = Unbeatable_player.new("O")
		board = ["O","X","-","-","O","-","X","-","-"]
		assert_equal(8,player.getMove(board))
	end

	def test_win_new_Player_return_2_diagonal_2
		player = Unbeatable_player.new("O")
		board = ["X","-","-","-","O","-","O","X","X"]
		assert_equal(2,player.getMove(board))
	end


	def test_block_new_Player_return_2_line_1
		player = Unbeatable_player.new("O")
		board = ["X","X","-","-","-","-","O","-","-"]
		assert_equal(2,player.getMove(board))
	end

	def test_block_new_Player_return_2_diagonal_1
		player = Unbeatable_player.new("O")
		board = ["X","-","-","-","X","-","O","-","-"]
		assert_equal(8,player.getMove(board))
	end

	
	def test_block_new_Player_return_4_diagonal_2
		player = Unbeatable_player.new("O")
		board = ["-","-","X","-","-","-","X","O","-"]
		assert_equal(4,player.getMove(board))
	end

	def test_start_center_choose_corner
		player = Unbeatable_player.new("O")
		board = ["-","-","-","-","X","-","-","-","-"]
		assert_equal(2,player.getMove(board))
	end

	def test_start_corner_choose_center
		player = Unbeatable_player.new("O")
		board = ["X","-","-","-","-","-","-","-","-"]
		assert_equal(4,player.getMove(board))
	end

	def test_start_edge_choose_center
		player = Unbeatable_player.new("O")
		board = ["-","X","-","-","-","-","-","-","-"]
		assert_equal(4,player.getMove(board))
	end

	def test_stop_fork
		player = Unbeatable_player.new("O")
		board = ["X","-","-","-","O","-","-","-","X"]
		assert_equal(1,player.getMove(board))
	end


	def test_stop_fork_2
		player = Unbeatable_player.new("O")
		board = ["-","-","X","-","O","-","X","-","-"]
		assert_equal(1,player.getMove(board))
	end

	# def test_stop_fork_2
	# 	player = Unbeatable_player.new("O")
	# 	board = ["-","-","X","-","O","-","X","X","X"]
	# 	assert_equal(1,player.getMove(board))
	# end


end