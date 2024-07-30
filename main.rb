require_relative "lib/board"

board = Board.new
board.display
puts "Input the starting position for the knight!"
print "X: "
x1 = gets.chomp.to_i
print "Y: "
y1 = gets.chomp.to_i
puts "Input the end position for the knight!"
print "X: "
x2 = gets.chomp.to_i
print "Y: "
y2 = gets.chomp.to_i
board.knight_travails([x1, y1], [x2, y2])
