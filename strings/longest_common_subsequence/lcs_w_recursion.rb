# https://www.youtube.com/watch?v=sSno9rV8Rhg

# Longest common subsequence

# with recursion time complexity O(2^n)
def lcs(s1, s2, i, j)
  if s1[i].nil? || s2[j].nil?
    return 0
  elsif s1[i] == s2[j]
    return 1 + lcs(s1, s2, i+1, j+1)
  else 
    return [lcs(s1, s2, i+1, j), lcs(s1, s2, i , j+1)].max
  end
end


# lcs with memoization
# time complexity O(n * m)
def lcs_w_memoization(s1, s2, i, j, memo)
  return 0 if s1[i].nil? || s2[j].nil?
  return memo[i][j] if memo[i][j]
  if s1[i] == s2[j]
     memo[i][j] = 1 + lcs(s1, s2, i+1, j+1)
     return memo[i][j]
  else 
    memo[i][j] =  [lcs(s1, s2, i+1, j), lcs(s1, s2, i , j+1)].max
    return memo[i][j]
  end
end

def lcs_w_memoization_main(s1, s2, i , j)
  memo = Array.new(s1.length) { Array.new(s2.length)}
  p lcs_w_memoization(s1, s2, 0, 0, memo)
end


s1 = "adce"
s2 = "acdfg"
# p lcs(s1, s2, 0, 0)
lcs_w_memoization_main(s1, s2, 0, 0)