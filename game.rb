require_relative 'board'
require_relative 'player'

require 'byebug'
class Game


  def initialize
    @board = Board.new
    @current_player = Player.new("Test", :white, @board)
    @other_player = Player.new("Test2",:black,  @board)

    # @display = Display.new(@board)
  end


  def play

    until over?
      # byebug
      begin
        start = @current_player.move

        # valided moves
        valid_start?(start)
        current_piece = board[start]
      rescue EmptySpaceError, WrongColorError
        puts "Must select non empty square"
        retry
      end

      begin
        possible_moves = current_piece.valid_moves
        end_pos = @current_player.move
        valid_move?(possible_moves, end_pos)
      rescue InvalidMoveError
        puts "Select new move"
        retry
      end

      board.make_move(start, end_pos)
      rotate_player!
      # byebug
    end

  end

  private
  attr_reader :display, :board, :current_player, :other_player

  def over?
    false
  end

  def valid_start?(start_pos)
    raise EmptySpaceError if board[start_pos].empty?
    raise WrongColorError unless board[start_pos].color == current_player.color
    raise InvalidMoveError if board[start_pos].valid_moves.empty?
  end

  def valid_move?(possible_moves, end_pos)
    raise InvalidMoveError unless possible_moves.include?(end_pos)
  end

  def rotate_player!
    @current_player, @other_player = @other_player, @current_player
  end

end


if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
