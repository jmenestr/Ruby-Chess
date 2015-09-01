require_relative 'all_pieces'

require_relative 'errors'

class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) { EmptySpace.new } }
    setup_board
  end

  def setup_board
    setup_black
    setup_white
  end

  def setup_black
    grid[6].map!.each_with_index do |_, col_index|
      Pawn.new([1, col_index], self, :black)
    end
    grid[7].map!.with_index do |_, col_index|
      if col_index == 0 || col_index == 7
        Rook.new([0, col_index], self, :black)
      elsif col_index == 1 || col_index == 6
        Knight.new([0, col_index], self, :black)
      elsif col_index == 2 || col_index == 5
        Bishop.new([0, col_index], self, :black)
      elsif col_index == 3
        King.new([0, col_index], self, :black)
      elsif col_index == 4
        Queen.new([0, col_index], self, :black)
      end
    end
  end

  def setup_white

    grid[1].map!.each_with_index do |_, col_index|
      Pawn.new([1, col_index], self, :white)
    end

    grid[0].map!.with_index do |_, col_index|
      if col_index == 0 || col_index == 7
        Rook.new([0, col_index], self, :white)
      elsif col_index == 1 || col_index == 6
        Knight.new([0, col_index], self, :white)
      elsif col_index == 2 || col_index == 5
        Bishop.new([0, col_index], self, :white)
      elsif col_index == 3
        King.new([0, col_index], self, :white)
      elsif col_index == 4
        Queen.new([0, col_index], self, :white)
      end
    end
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos,value)
    row, col = pos
    grid[row][col] = value
  end

  def in_bounds?(pos)
    row,col = pos
    (0..7).include?(row) && (0..7).include?(col)
  end

  def rows
    grid
  end

  def empty_space?(pos)
    board[pos].empty?
  end

  def move(start_pos, end_pos)
    raise EmptySpaceError if self[start_pos].empty?
    raise InvalidMoveError if invalid_move?(end_pos)

    piece = self[start_pos]
    empty_space = self[end_pos]
    self[start], self[end_pos] = empty_space, piece
  end

  private
  attr_accessor :grid
end
