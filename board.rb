require_relative 'pieces'
require_relative 'errors'

class Board
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    setup
  end

  def setup
    grid[0..1].each do |row|
      row.map! { Piece.new("p") }
    end
    grid[2..5].each do |row|
      row.map! { EmptySpace.new }
    end
    grid[6..7].each do |row|
      row.map! { Piece.new("p") }
    end
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def [](pos,value)
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
