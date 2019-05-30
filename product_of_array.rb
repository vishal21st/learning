# @param {Integer[]} nums
# @return {Integer[]}

# Input:  [1,2,3,4]
# Output: [24,12,8,6]
def product_except_self(nums)
  n = nums.length
  res = []
  left = 1
  for i in (0..(nums.length - 1))
    res[i] = left
    left = left * nums[i]
  end
  right = 1


  for i in ((0..(nums.length - 1)).reverse_each)
    res[i] = res[i] * right
    right = right * nums[i]
  end
  res
end


# 1 = 2 * 3 * 4
# 2 = 1 * 3 * 4
# 3 = 1 * 2 * 4
# 4 = 1 * 2 * 3
