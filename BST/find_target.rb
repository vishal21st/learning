# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @param {Integer} k
# @return {Boolean}

def find_target(root, k)
  hash = {}
  return dfs(root, hash, k)
end

def dfs(root, hash, k)
  return false if root.nil?
  return true if (root.val == k)
  return true if hash[(root.val - k).abs] 
  hash[root.val] = root.val
  return dfs(root.left, hash , k) || dfs(root.right, hash, k)
end
