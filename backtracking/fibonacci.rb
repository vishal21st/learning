# memoizingHash = {}
def fibonacci(n)
  memo = {}  
  fib(n, memo)
  # Write your code here
end

def fib(n, memo)
  return memo[n] if memo[n]
  return n if (n <= 1)
  memo [n]  = fib(n - 1, memo) + fib(n - 2, memo)
  return memo[n]
end

p fibonacci(5)


# 0 1 1 2 3 5

