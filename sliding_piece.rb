require_relative 'pieces'

class SlidingPiece < Piece
  def move
    possible_moves = []
    step_dir.each do |direction|
      next_space = add_positions(position, direction)

      while true
        break unless board.in_bounds?(next_space)

        if board[next_space].empty?
          possible_moves << next_space
        elsif own_color?(board[next_space])
          break
        else
          possible_moves << next_space
          break
        end

        next_space = add_positions(next_space, direction)
      end
    end
    possible_moves
  end

  private

  def add_positions(current_position, direction)
    current_row, current_col = current_position
    direction_row, direction_col = direction
    [current_row + direction_row, current_col + direction_col]
  end
end
