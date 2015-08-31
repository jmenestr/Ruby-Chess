require_relative 'board'
require_relative 'player'


class Game


  def initialize
    @board = Board.new
    @player = Player.new("Test", @board)

    # @display = Display.new(@board)
  end


  def play

    @player.move
    # until over?
    #   move
    #   switch_players
    #   render_board
    # end
  end

  private
  attr_reader :display

  def over?
    true
  end

end


if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
