
require_relative 'stepping_piece'
require 'colorize'


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