require 'pry'
# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end

  def preorder_traversal(root, array)
    return if root.nil?
    preorder_traversal(root.left, array)
    array.push(root.val)
    preorder_traversal(root.right, array)
  end

  def post_order_traversal(root, array)
    return if root.nil?
    post_order_traversal(root.right, array)
    array.push(root.val)
    post_order_traversal(root.left, array)
  end

end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)
  return is_mirror(root.left, root.right)
end

def is_mirror(root1, root2)
  return true if (root1.nil? && root2.nil?)

  if (root1 && root2 && root1.val == root2.val)
    return is_mirror(root1.left, root1.right) && is_mirror(root2.left && root2.right)
  else
    false
  end
end

tree1 = TreeNode.new(2)
tree1.left = TreeNode.new(3)
tree1.right = TreeNode.new(4)

tree2 = TreeNode.new(2)
tree2.left = TreeNode.new(3)
tree2.right = TreeNode.new(4)

tree = TreeNode.new(1)
tree.left = tree1
tree.right = tree2


is_symmetric(tree)
