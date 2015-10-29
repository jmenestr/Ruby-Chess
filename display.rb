require 'colorize'
require_relative 'cursorable'
require_relative 'board'


class Display
  include Cursorable
  attr_reader :board
  attr_accessor :selected_piece
  ROW_TO_LET = [
    [" a "],
    [" b "],
    [" c "],
    [" d "],
    [" e "],
    [" f "],
    [" g "],
    [" h "]
  ]

  def initialize(board)
    @board = board
    @cursor_pos = [0,5]
    @selected_piece = nil
  end

  def build_grid
    @board.rows.map.with_index do |row, i|
      build_row(row, i)
    end
  end

  def build_row(row, i)
    ROW_TO_LET[i] + row.map.with_index do |piece, j|
      color_options = colors_for(i, j)
      piece.to_s.colorize(color_options)
    end
  end

  def colors_for(i, j)
    if [i, j] == @cursor_pos
      bg = :yellow
    elsif get_valid_moves.include?([i,j])
      bg = :green
    elsif (i + j).odd?
      bg = :white
    else
      bg = :red
    end
    { background: bg }
  end

  def get_valid_moves
    board[@cursor_pos].valid_moves
  end

  def render
    system("clear")
    puts "Use the arrows to make a move!"
    puts (["   "]+ (0..7).to_a.map { |num| " #{num} "}).join
    build_grid.each { |row| puts row.join }
    nil
  end
end
