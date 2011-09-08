class Knight < ChessPiece
  def is_move_legal?(board, x, y)
    # Knight moves in L or stays in its place
    return super && ( (board.current_x == x) && (board.current_y == y) ||
                      ((board.current_x - x).abs == 1) && ((board.current_y - y).abs == 2) ||
                      ((board.current_x - x).abs == 2) && ((board.current_y - y).abs == 1))
  end
end