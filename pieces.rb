class Piece

  def initialize(board, position)
    @board = board
    @position = position
  end

  def empty?
    false
  end

  def to_s
    " P "
  end

  def move

  end
end

class SlidingPiece < Piece

end

class SteppingPiece < Piece

end

class Pawn < Piece
end

class EmptySpace
  def to_s
    "   "
  end

  def empty?
    true
  end
end
