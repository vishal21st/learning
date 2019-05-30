# Given a binary tree, return the vertical order traversal of its nodes' values. (ie, from top to bottom, column by column).

# If two nodes are in the same row and column, the order should be from left to right.

# Input: [3,9,20,null,null,15,7]

#    3
#   /\
#  /  \
#  9  20
#     /\
#    /  \
#   15   7 

# Output:

# [
#   [9],
#   [3,15],
#   [20],
#   [7]
# ]


# Definition for a binary tree node.
# Definition for a binary tree node.
require 'pry'
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {Integer[][]}
def vertical_order(root)
  map = {}
  get_vertical_order(root,0, map)
  arr = []

  map.each do |key, val|
    arr << val
  end
  arr
end

def get_vertical_order(root, hd, hash)
  queue = []
  queue << [root, 0]
  while !queue.empty?
    tmp = queue.shift
    node = tmp.first
    hd = tmp.last
    if hash[hd]
      hash[hd] << node.val
    else
      binding.pry
      hash[hd] << [node.val]
    end

    queue << [node.left, hd - 1] unless node.left.nil?
    queue << [node.right, hd + 1] unless node.right.nil?
  end
end

tree = TreeNode.new(1)
tree.left = TreeNode.new(2)
tree.right = TreeNode.new(3)

vertical_order(tree)
