class Bishop < ChessPiece
  def is_move_legal?(board, x, y)
    # bishop moves only diagonally
    return super && (x-board.current_x).abs == (y-board.current_y).abs
  end
end