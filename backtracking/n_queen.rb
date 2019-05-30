require 'pry'

def n_queen(arr, n, row, column, pos)
  if row == n 
    return pos
  end

  if bounding_func(arr, row, column, pos)
    pos[row] = [row, column]
    arr[row, column] = 1
    row = row + 1
    column = 0
    n_queen(arr, n, row, column, pos)
  else
    if column != n - 1
      column += 1
      n_queen(arr, n, row, column, pos)
    elsif row > 0
      row -= 1
      n_queen(arr, n, row, column, pos)
    else
      return pos
    end
  end
end

def bounding_func(arr, row, column, pos)
  return true if pos.empty?
  is_left_diagonal_valid = (row - column) != (pos[row - 1][0] - pos[row - 1][1])
  is_right_diagonal_valid = (row + column) != (pos[row - 1][0] + pos[row - 1][1])
  is_column_valid = !pos.map{ |p| p[1]}.include?(column)
  is_left_diagonal_valid && is_right_diagonal_valid && is_column_valid
end

arr = Array.new(5) { Array.new(5) { 0 } }
pos = []
p n_queen(arr, 5, 0, 0, pos)
