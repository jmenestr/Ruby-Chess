
require_relative 'pieces'

class SteppingPiece < Piece
  def move
    possible_moves = []
    step_dir.each do |direction|
      possible_moves << add_position(direction)
    end
    possible_moves
  end

  private

  def add_position(direction)
    current_row, current_col = position
    direction_row, direction_col = direction
    [current_row + direction_row, current_col + direction_col]
  end
end
