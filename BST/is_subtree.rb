# Definition for a binary tree node.
require 'pry'
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} s
# @param {TreeNode} t
# @return {Boolean}
def is_subtree(s, t)
  if t.nil?
    return true
  end

  if s.nil?
    return false
  end
  
  if identical(s, t)
    return true
  end

  return (is_subtree(t.left, s) || is_subtree(t.right, s))
end


def identical(s, t)
  arr1 = []
  arr2 = []
  in_order_traversal(s, arr1)
  in_order_traversal(t, arr2)
  (arr1 == arr2)
end

def find(root, v)
  return if root.nil?
  return root if root.val == v
  return find(root.right, v) || find(root.left, v)
end

def in_order_traversal(root, arr)
  return nil if root.nil?
  in_order_traversal(root.left, arr)
  arr.push root.val
  in_order_traversal(root.right, arr)
end



s1 = TreeNode.new(3)
s2 = TreeNode.new(4)
s3 = TreeNode.new(5)
s1.left = s2
s1.right = s3
s2.left = TreeNode.new(1)
s2.right = TreeNode.new(2)

t1 = TreeNode.new(4)
t2 = TreeNode.new(1)
t3 = TreeNode.new(2)
t1.left = t2
t1.right = t3
is_subtree(s1, t1)
