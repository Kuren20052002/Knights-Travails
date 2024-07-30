require_relative "knight"
require "set"
require "pry-byebug"
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) { " " } }
  end

  def place_knight(pos)
    @knight = Knight.new(pos, self)
  end

  def display
    @board.reverse.each_with_index do |row, row_idx|
      print "#{8 - row_idx}  "
      row.each do |square|
        print "[#{square}] "
      end
      puts "\n\n"
    end
    puts "    1   2   3   4   5   6   7   8"
  end

  def knight_travails(start, goal)
    start = pos_to_index(start)
    goal = pos_to_index(goal)

    place_knight(start)
    queue = Queue.new
    queue.push([start, [start]])

    visited = Set.new([start])
    until queue.empty?
      current, path = queue.pop
      @knight.move(current)

      if current == goal
        puts "You made it in #{path.length - 1} moves!"
        path.each { |x, y| puts "[#{x + 1}, #{y + 1}]" }
      end

      @knight.possible_moves.each do |move|
        next if visited.include?(move)

        new_path = path + [move]
        queue.push([move, new_path])
        visited.add(move)
      end
    end
  end

  def pos_to_index(pos = [1, 1])
    [pos[0] - 1, pos[1] - 1]
  end
end
