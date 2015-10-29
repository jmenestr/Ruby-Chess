
require_relative 'sliding_piece'

require 'colorize'

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