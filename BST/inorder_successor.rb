# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right, :root
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

def find_min(root, data)
  while !root.left.nil?
    root = root.left
  end
  root
end

def find(root, p)
  return if root.nil?
  if  root.val == p
    return root
  elsif root.val > p
    return find(root.left, p)
  else
    return find(root.right, p)
  end
end

def inorder_successor(root, p)
  return if root.nil?
  current = find(root, p.val)
  successor = nil
  retun nil if current.nil?
  # case 1 current has right subtree
  if current.right
    successor = current.right
    while successor.left
      successor = successor.left
    end
  else
  # case 2 when no right subtree
    successor = nil
    ancestor = root
    while ancestor != current
      if ancestor.val > current.val
        successor = ancestor
        ancestor = ancestor.left
      else
        ancestor = ancestor.right
      end
    end
  end
  successor
end

t = TreeNode.new(0)

inorder_successor(t, t)
