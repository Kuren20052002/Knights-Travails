require "pry-byebug"
class Knight
  def initialize(pos, board)
    @current_pos = pos
    @board = board
    @moveset = [[-1, -2], [-2, -1], [1, -2], [2, -1], [2, 1], [1, 2], [-1, 2], [-2, 1]]
  end

  def possible_moves
    moves = []
    @moveset.each do |move|
      x = @current_pos[0] + move[0]
      y = @current_pos[1] + move[1]
      moves << [x, y] if x.between?(0, 7) && y.between?(0, 7)
    end
    moves
  end

  def move(pos)
    @current_pos = pos
  end

  def to_s
    "K"
  end
end
