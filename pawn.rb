class Pawn < ChessPiece
  def is_move_legal?(board, x, y)
    # Pawn stays in its place, or moves 1 space up or 2 if it is in the bottom of the board and its the first move.
    return super && ( ((board.current_x == x) && (board.current_y == y)) ||
                      (((x-board.current_x) == -1) && board.current_y == y) ||
                      (((x-board.current_x) == -2) && board.current_y == y && board.current_x >=2 && board.move_count == 0))
  end

  def move_piece(x, y)
    # Pawn transforms to Queen when it reaches the top of the board
    return (x == 0)? Queen.new : self
  end
end