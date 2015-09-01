require_relative 'stepping_piece'
require_relative 'sliding_piece'
require 'colorize'

class Queen < SlidingPiece
  STEP_DIR = [
    [1,1],
    [1,-1],
    [1,0],
    [0,1],
    [0,-1],
    [-1,1],
    [-1,-1],
    [-1,0]
  ].freeze

  def slide_dir
    STEP_DIR
  end

  def to_s
    color == :black ? " \u{265B} ".colorize(:black) : " \u{2655} "
  end
end

class King < SteppingPiece
  STEP_DIR = [
    [1,1],
    [1,-1],
    [1,0],
    [0,1],
    [0,-1],
    [-1,1],
    [-1,-1],
    [-1,0]
  ]

  def step_dir
    STEP_DIR
  end

  def to_s
    color == :black ? " \u{265A} ".colorize(:black) : " \u{2654} "
  end
end

class Rook < SlidingPiece
  STEP_DIR = [
    [1,0],
    [0,1],
    [0,-1],
    [-1,0]
  ]

  def slide_dir
    STEP_DIR
  end

  def to_s
    color == :black ? " \u{265C} ".colorize(:black) : " \u{2656} "
  end
end

class Bishop < SlidingPiece
  STEP_DIR = [
    [1,1],
    [1,-1],
    [-1,1],
    [-1,-1]
  ]

  def slide_dir
    STEP_DIR
  end

  def to_s
    color == :black ? " \u{265D} ".colorize(:black) : " \u{2657} "
  end

end

class Knight < SteppingPiece
  STEP_DIR = [
    [1,2],
    [1,-2],
    [2,1],
    [2,-1],
    [-1,2],
    [-1,-2],
    [-2,1],
    [-2,-1]
  ]

  def step_dir
    STEP_DIR
  end

  def to_s
    color == :black ? " \u{265E} ".colorize(:black) : " \u{2658} "
  end

end

class Pawn < Piece

  def to_s
    color == :black ? " \u{265F} ".colorize(:black) : " \u{2659} "
  end

end
