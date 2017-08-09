require("minitest/autorun")
require("minitest/rg")
require_relative("../board.rb")
require_relative("../player.rb")


class TestBoard < MiniTest::Test

  def setup

    @bob = Player.new("Bob")
    @anne = Player.new("Anne")
    @meg = Player.new("Meg")
    @board = Board.new(
      [0, 0, 0, 3, 0, 0, 0, 0, 7, 0,
        -3, 0, -8, 0, 0, 0, 0],

        [@bob, @anne, @meg],

        @bob
    )


  end

  def test_player_turn
    assert_equal(@bob, @board.turn)
  end

  def test_next_turn
    assert_equal(@anne, @board.next_turn)
  end

  def test_next_turn_last
    assert_equal(@anne, @board.next_turn)
  end

  def test_play_turn
    current_position = @bob.position
    @board.play_turn
    new_position = @bob.position
    assert_equal(false, (current_position ==
    new_position))
  end

  # def test_play_turn_win
  #   assert_equal("You are the winner!", @board.play_turn)
  # end
  #
  # def test_play_turn_snake
  #   @board.play_turn
  #   assert_equal(7, @bob.position)
  # end
  #
  # def test_bobwins
  #   assert_equal("You are finished!", @board.play_turn)
  # end
  #
  # def test_bobsgone
  #   @board.play_turn
  #   assert_equal([@anne, @meg], @board.players)
  # end

  def test_unlucky_bob
    @board.play_turn
    assert_equal(4, @bob.position)
  end



end
