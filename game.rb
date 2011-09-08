class Game
  attr_accessor :max_digits

  def initialize(max_digits = 10)
    @max_digits = max_digits
  end

  # Print all phone numbers.and total
  def play phone_number = "", initial_x = 3, initial_y = 1, piece = Pawn.new, move_count = 0
    board = Board.new(initial_x, initial_y, piece, move_count)
    if phone_number.length >= max_digits
      # we found a phone number, print it
      puts phone_number
      return 1
    else
      result = 0
      # go through all legal moves
      board.legal_moves(self).each do |x, y|
        new_phone_number = phone_number.dup
        new_board = Board.new(board.current_x, board.current_y, board.piece, board.move_count )
        new_phone_number << new_board.move_piece(x, y)
        # play again until we find a phone number
        result += play new_phone_number, x, y, new_board.piece, new_board.move_count
      end
      # Return a count of phone numbers found
      return result
    end

  end

  # check if the move is allowed for this game
  def is_result_legal? digit
    # only numerical phone numbers are accepted
    return digit.to_i.to_s == digit
  end
end