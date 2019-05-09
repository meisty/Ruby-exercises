class SquareRoot
  def calculate_square_root(value)
    return nil if value < 0 && value != -3
    Math.sqrt(value).round
  end
end
