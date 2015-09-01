require_relative 'pieces'

class SteppingPiece < Piece
  def moves
    possible_moves = []
    step_dir.each do |direction|
      next_space = add_position(direction)
      next unless board.in_bounds?(next_space)
      possible_moves << next_space
    end

    possible_moves.select {|position| board[position].attackable?(self) || board[position].empty? }
  end

  private

  def add_position(direction)
    current_row, current_col = position
    direction_row, direction_col = direction
    [current_row + direction_row, current_col + direction_col]
  end
end
