class King < ChessPiece
  def is_move_legal?(board, x, y)
    # King moves 1 in any direction, or stays in place
    return super && ( (board.current_x == x) && (board.current_y == y) ||
                      ((board.current_x - x).abs <= 1) && ((board.current_y - y).abs <= 1))
  end
end