require './game.rb'
require './board.rb'
require './chess_piece.rb'
require './king.rb'
require './queen.rb'
require './bishop.rb'
require './knight.rb'
require './rook.rb'
require './pawn.rb'
require "rubygems"
require "highline/import"

max_digits = ask("How many digits should I look for?", Integer) { |q| q.in = 0..10; q.default=10 }

piece = nil
choose do |menu|
    menu.prompt = "Please choose the chess piece:"
    menu.choice(:pawn) { piece = Pawn.new }
    menu.choice(:rook) { piece = Rook.new }
    menu.choice(:knight) { piece = Knight.new }
    menu.choice(:bishop) { piece = Bishop.new }
    menu.choice(:queen) { piece = Queen.new }
    menu.choice(:king) { piece = King.new }
end

starting_point = ask("Where should we start? \n7 8 9\n4 5 6\n1 2 3\n* 0 #") { |q| q.limit = 1 }
initial_x, initial_y = Board.find_digit(starting_point)

game = Game.new(max_digits)
result = game.play("", initial_x, initial_y, piece, 0)
puts "#{result} results found."
