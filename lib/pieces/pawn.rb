
require_relative 'piece'
require 'colorize'

class Pawn < Piece

  def moves
    start_position = position
    passive_moves(start_position) + attacking_moves(start_position)
  end

  def to_s
    color == :black ? " \u{265F} ".colorize(:black) : " \u{2659} "
  end

  private

  def passive_moves(start_position)
    passive = []

    step_dir.each do |direction|
      next_space = add_positions(start_position, direction)
      next unless board.in_bounds?(next_space)

      if first_move?
        2.times do
          passive << next_space
          next_space = add_positions(next_space, direction)
        end
      else
        passive << next_space
      end
    end

    passive.select { |position| board[position].empty? }
  end

  def attacking_moves(start_position)
    attacks = []

    jump_dir.each do |direction|
      next_space = add_positions(start_position, direction)
      next unless board.in_bounds?(next_space)
      attacks << next_space if board[next_space].attackable?(self)
    end

    attacks
  end

  def step_dir
    if color == :white
      [[1,0]]
    elsif color == :black
      [[-1,0]]
    end
  end

  def jump_dir
    if color == :white
      [[1,1],[1,-1]]
    elsif color == :black
      [[-1,1],[-1,-1]]
    end
  end

  def first_move?
    if color == :white
      self.position[0] == 1
    elsif color == :black
      self.position[0] == 6
    end
  end

end
