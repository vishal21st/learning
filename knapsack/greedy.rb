count = 0
def knapsack(wi, vi, n, w)
  if w == 0 || n == 0
    return 0
  end

  if wi[n-1] > w
    return knapsack(wi, vi, n-1, w)
  end
  
  return [(vi[n-1] + knapsack(wi, vi, n-1, w - wi[n-1])), knapsack(wi, vi, n-1, w)].max
end

wi = [10, 20, 30]
vi = [6, 4, 1]
w =  10
n = wi.count

p knapsack(wi, vi, n, w)
