require_relative 'pieces'
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
    grid[0..1].each_with_index do |row, row_index|
      row.map!.with_index do |_, col_index|
        Piece.new([row_index, col_index], self, :black)
      end
    end
  end

  def setup_white
    grid[6..7].each_with_index do |row, row_index|
      row.map!.with_index do |_, col_index|
        Piece.new([row_index, col_index], self, :white)
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
