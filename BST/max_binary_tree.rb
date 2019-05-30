require 'pry'
# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {Integer[]} nums
# @return {TreeNode}
def construct_maximum_binary_tree(nums)
  if nums
    num = nums.max
    index = nums.index(num)
    node = TreeNode.new(num)
    node.left = construct_maximum_binary_tree(nums[0..(index - 1)]) if (index - 1) > 0
    node.right = construct_maximum_binary_tree(nums[(index + 1)..nums.length - 1]) if (index + 1) <= nums.length
    return node
  end
end


construct_maximum_binary_tree([3,2,1,6,0,5])
