class Piece

  def initialize(type)
    @type = type
  end

  def empty?
    false
  end

  def to_s
    "P"
  end

end

class EmptySpace
  def to_s
    " "
  end

  def empty?
    true
  end
end
