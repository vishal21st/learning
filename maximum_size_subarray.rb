# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
require 'pry'
def max_sub_array_len(nums, k)
  map = {}
  map[0] = -1
  max_len = 0
  sum = 0
  for i in (0..(nums.length - 1))
    sum += nums[i]

    if map[sum].nil?
      map[sum] = i
    end

    if map[sum - k]
      max_len = [max_len, i - map[sum - k]].max
    end
  end

  max_len
end

max_sub_array_len([1, -1, 5, -2, 3], 3)
