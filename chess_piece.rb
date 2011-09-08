class ChessPiece
  # check if the piece can make the given move.
  def is_move_legal? (board, final_x, final_y)
    return board.is_move_legal?(final_x, final_y)
  end

  # move the piece, and return the transformation if applicable
  def move_piece(x, y)
    return self
  end
end