class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) { " " } }
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
end
