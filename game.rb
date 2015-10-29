require_relative 'lib/board/board'
require_relative 'lib/player/player'
require_relative 'lib/display/display'

class Game

  def initialize
    @board = Board.new
    @current_player = Player.new("Test", :white, @board)
    @other_player = Player.new("Test2",:black,  @board)
    @display = Display.new(@board)
  end


  def play

    until over?
      begin
        first_move = make_first_move
      rescue InvalidMoveError, WrongColorError, EmptySpaceError
        retry
      end

      begin
        second_move = make_second_move(first_move)
      rescue InvalidMoveError, WrongColorError
        retry
      end
      board.make_move(first_move, second_move)

      rotate_player!
      end

  end

  private
  attr_reader :display, :board, :current_player, :other_player

  def make_first_move
    position = @current_player.move
    raise EmptySpaceError if board[position].empty?
    raise WrongColorError unless board[position].color == current_player.color
    raise InvalidMoveError if board[position].valid_moves.empty?

    position

  end

  def make_second_move(first_move)

    second_position = @current_player.move
    raise InvalidMoveError unless board[first_move].valid_moves.include?(second_position)
    second_position
  end

  def select_move_to_space
    result = nil
    until result
      @display.render
      result = display.get_input
    end
    result
  end



  def over?
    false
  end

  def valid_move?(pos)

  end

  def rotate_player!
    @current_player, @other_player = @other_player, @current_player
  end

end


if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
