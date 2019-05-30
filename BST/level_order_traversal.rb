# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left, @right = nil, nil
  end
end

# @param {TreeNode} root
# @return {Integer[][]}
def level_order(root)
  return [] if root.nil?
  array = []
  queue = []
  queue.push(root)
  while queue.length > 0
    sub_arr = []
    sub_queue = []
    while queue.length > 0
      el = queue.shift
      return if el.nil?
      sub_arr << el.val
      sub_queue.push(el.right) if el.right
      sub_queue.push(el.left) if el.left
    end
    array << sub_arr
    queue << sub_queue
    queue  = queue.flatten
  end

  return array
end
