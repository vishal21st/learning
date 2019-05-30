# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  for i in (0..(nums.length - 1))
    for j in (i+1..(nums.length - 1))
      return [i, j] if nums[j] + nums[i] == target
    end
  end
end
