class Rook < ChessPiece
  def is_move_legal?(board, x, y)
    # Rook moves on the x or y axis, or stays in its place
    return super && ((board.current_x == x) || (board.current_y == y) )
  end
end