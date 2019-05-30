# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @param {Float} target
# @return {Integer}
def closest_value(root, target)
  min = Float::INFINITY
  result = root.val

  while root do
    if target < root.val
      diff = (root.val - target).abs
      if (diff < min)
        result = root.val
        min = [diff, min].min
      end
      root = root.left
    elsif target > root.val
      diff = (root.val - target).abs

      if diff < min
        result = root.val
        min = [diff, min].min
      end
      root = root.right
    else
      result = root.val
      return result
    end
  end

  return result
end


def closest_value(root, target)
  min = Float::INFINITY
  closest = root.val
  helper(root, target, min, closest)
  return closest
end


def helper(root, target, min, closest)
  return if root.nil?
  diff = (root.val - target).abs
  if  diff < min 
    min = diff
    closest = root.val
  end

  if target < root.val
    helper(root.left, target, min, closest)
  else
     helper(root.right, target, min, closest)
  end
end
