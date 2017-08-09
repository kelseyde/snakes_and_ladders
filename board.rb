require_relative 'dice'

class Board

  def initialize(tiles, players, turn)
    @tiles = tiles
    @players = players
    @turn = turn
    @dice = 6
  end

  attr_reader(:squares, :players, :turn)
  attr_writer(:squares, :players, :turn)

  def turn
    return @turn
  end

  def players
    return @players
  end

  def rand_roll
    return 1 + rand(@dice)
  end

  def next_turn
    if @turn == @players.last
      @turn = @players.first
    else
      current_index = @players.index(@turn) #0
      new_index = current_index += 1
      new_turn_player = @players[new_index]
      @turn = new_turn_player
    end
  end

  def play_turn
    player = @turn
    player.move(1 + rand(@dice))
    if player.position <= 16
      player.move(@tiles[player.position])
    elsif player.position > 16
      how_many_over = (player.position - 16)
      player.position = (16 - how_many_over)
      player.move(@tiles[player.position])
    elsif player.position == 16
      @players.delete(player)
      return "You are finished!"
    end
  end








end
