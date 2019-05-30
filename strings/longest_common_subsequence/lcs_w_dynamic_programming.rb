# https://www.youtube.com/watch?v=sSno9rV8Rhg


require 'pry'
# time complexity O(m*n)
def lcs(s1, s2)
  matrix = Array.new(s1.length + 1) {Array.new(s2.length + 1, 0)}
  matrix = fill_matrix(s1, s2, matrix)
  p find_lcs(s1, matrix, s1.length, s2.length).reverse
end

def  fill_matrix(s1, s2, matrix)
  1.step(s1.length, 1) do |i|
    1.step(s2.length, 1) do |j|
      if s1[i - 1] != s2[j - 1]
        matrix[i][j] = [matrix[i - 1][j], matrix[i][j - 1]].max
      elsif s1[i - 1] == s2[j - 1]
        matrix[i][j] = 1 + matrix[i - 1][j -1]
      end
    end
  end
  matrix
end

def find_lcs(s1, matrix, i , j)
  return "" if i == 0 || j == 0
  if matrix[i][j] == matrix[i-1][j]
    return find_lcs(s1,matrix, i-1, j)
  elsif matrix[i][j] == matrix[i][j - 1]
    return find_lcs(s1, matrix, i, j+1)
  elsif matrix[i][j] == matrix[i-1][j-1] + 1
    return s1[i-1] + find_lcs(s1, matrix, i-1, j-1)
  end
end

s1 = "longest"
s2 = "stone"
lcs(s1, s2)
