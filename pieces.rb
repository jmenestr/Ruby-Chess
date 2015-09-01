class Piece

  def initialize(board, position, color)
    @board = board
    @position = position
    @color = color
  end

  attr_reader :position, :color, :board

  def empty?
    false
  end

  def to_s
    " P "
  end

  def move
  end

  private
  def own_color?(other_piece)
    color == other_piece.color
  end

end



class EmptySpace
  def to_s
    "   "
  end

  def empty?
    true
  end
end
