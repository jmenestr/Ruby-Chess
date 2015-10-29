
require_relative 'stepping_piece'
require_relative 'sliding_piece'
require_relative 'piece'

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
