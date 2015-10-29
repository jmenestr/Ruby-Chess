
require_relative 'stepping_piece'
require 'colorize'

class King < SteppingPiece

  def initialize(position, board, color)
    super
    board.kings << self
  end

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