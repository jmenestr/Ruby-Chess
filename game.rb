require_relative 'board'
require_relative 'player'
require_relative 'display'

class Game


  def initialize
    @player = Player.new("Test")
    @board = Board.new
    @display = Display.new(@board)
  end


  def play
    render_board
    # until over?
    #   move
    #   switch_players
    #   render_board
    # end
  end

  private
  attr_reader :display

  def render_board
    display.render
  end

  def over?
    true
  end

end


if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
