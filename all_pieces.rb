require_relative 'stepping_piece'
require_relative 'sliding_piece'


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

  def step_dir
    STEP_DIR
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
end

class Rook < SteppingPiece
  STEP_DIR = [
    [1,0],
    [0,1],
    [0,-1],
    [-1,0]
  ]

  def step_dir
    STEP_DIR
  end
end

class Bishop < SlidingPiece
  STEP_DIR = [
    [1,1],
    [1,-1],
    [-1,1],
    [-1,-1]
  ]

  def step_dir
    STEP_DIR
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
end

class Pawn
end
