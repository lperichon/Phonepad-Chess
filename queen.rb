class Queen < ChessPiece
  def is_move_legal?(board, x, y)
    # queen moves on the x and y axis or diagonally, or stays in its place
    return super && ((board.current_x == x) ||
                     (board.current_y == y) ||
                     (x-board.current_x).abs == (y-board.current_y).abs)
  end
end