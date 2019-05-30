# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
      @val = val
      @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
  return true if root.nil?
  if is_lesser?(root.left, root.val) &&
    is_greater?(root.right, root.val) &&
    is_valid_bst(root.left)  &&
    is_valid_bst(root.right)
    return true
  else
    return false
  end
end

def is_lesser?(root, val)
  return true if root.nil?
  if root.val <= val && is_lesser?(root.left, val) && is_lesser?(root.right, val)
    return true
  else
    return false
  end
end

def is_greater?(root, val)
  return true if root.nil?
  if root.val > val && is_greater?(root.left, val) && is_greater?(root.right, val)
    return true
  else
    return false
  end
end


# another approach

def is_valid_bst(root)
  return bst_util(root, 1/0.0, -1/0.0)
end

def bst_util(root, max, min)
  if root.val > min && root.value <  max && 
    bst_util(root.left, max, root.left.val) && 
    bst_util(root.right, root.right.val, min)
    return true
  else
    return false
  end
end
