
require_relative 'sliding_piece'
require 'colorize'


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
