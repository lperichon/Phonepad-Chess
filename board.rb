class Board
  attr_accessor :board, :piece, :current_x, :current_y, :move_count

  @@board = [['7','8','9'],
               ['4','5','6'],
               ['1','2','3'],
               ['*','0','#']]


  def initialize(current_x, current_y, piece, move_count)
    @current_x, @current_y = current_x, current_y
    @piece = piece
    @move_count = move_count
  end

  # Returns the value for the given position on the board
  def self.value(x, y)
    @@board[x][y]
  end

  # move the current piece to x,y, and perform any alterations on the piece (pawn becomes queen)
  def move_piece(x, y)
    if piece.is_move_legal? self, x, y
      #puts "move #{piece.class} from #{current_x},#{current_y} to #{x},#{y}"
      current_x = x
      current_y = y
      @piece = piece.move_piece(x,y)
      @move_count = @move_count + 1
      return Board.value(x, y)
    end
  end

  # check if the move is between the boundaries
  def is_move_legal?(final_x, final_y)
    return @@board.length > current_x && @@board.length > final_x && @@board[current_x].length > current_y && @@board[final_x].length > final_y
  end

  # list all legal moves for the current piece at the current position
  def legal_moves(game)
    legal_moves = []
    (0..@@board.length).each do |x|
      (0..@@board.length).each do |y|
        legal_moves << [x, y] if piece.is_move_legal?(self, x, y) && game.is_result_legal?(Board.value(x,y))
      end
    end
    legal_moves
  end

  def self.board
    @@board
  end

  # Find the x,y position of the given digit
  def self.find_digit(num)
    (0..@@board.length).each do |x|
      (0..@@board.length).each do |y|
        return x, y if value(x,y) == num
      end
    end
  end
end