# Binary Search tree
# https://www.youtube.com/watch?v=pYT9F8_LFTM

# Time complexity
#         Array  (Unsorted)     LinkedList        BST
# Search:   O(n)                  O(n)            O(log(n))
# Input:    O(1)- O(n)            O(1) - O(n)     O(log(n))
# Delete:   O(n)                  O(n)            O(log(n))

# BST: For each node value of left sub tree is always lesser than root node and 
# value of right subtree is always greater

# Balance BST: When difference of node in left and right node is not more than 1 

require 'pry'
class Node
  attr_accessor :value, :left, :right
  def initialize(v)
    self.left = nil
    self.right = nil
    self.value = v
  end

  def insert(v)
    if self.value > v
      insert_left(v)
    elsif self.value < v
      insert_right(v)
    end
  end

  def delete(v)
    if self.value > v
      delete_left(v)
    elsif self.value < v
      delete_right(v)
    else
      # case 1 when leaf node
     
      # case 2 when 1 child
      if self.right.nil?
        self.left
      elsif self.left.nil?
        self.right
      else
        # case 3 when 2 child
        # take left most child of right child and assign

        root = self.right
        while root.left do
          root = root.left
        end
        self.value = root.value
        self.right = self.right.delete(self.value)
      end
    end
    self
  end

  def search(v)
    if self.value > v
      return search_left(v)
    elsif self.value < v
      return search_right(v)
    elsif self.value == v
     return self
    end
  end

  # level by level
  def level_order_traversal(root)
    return if root.nil?
    queue = Queue.new
    queue.push(root)
    while !queue.empty?
      node = queue.pop
      queue.push(node.left) unless node.left.nil?
      queue.push(node.right) unless node.right.nil?
      p node.value
    end

  end

  # visit root -> left -> right
  def preorder_traversal(root)
    return if root.nil?
    p root.value
    preorder_traversal(root.left)
    preorder_traversal(root.right)
  end

  def inorder_traversal(root)
    return if root.nil?
    inorder_traversal(root.left)
    p root.value
    inorder_traversal(root.right)
  end

  def postorder_traversal(root)
    return if root.nil?
    postorder_traversal(root.left)
    postorder_traversal(root.right)
    p root.value
  end

  def is_bst?(root)
    return true if root.nil?
    if is_subtree_lesser?(root.left, root.value) &&
       is_subtree_greater?(root.right, root.value) &&
       is_bst?(root.left) && is_bst?(root.right)
      return true
    else
      return false
    end
  end



  private
  def is_subtree_lesser?(root, value)
    return true if  root.nil?
    if root.value <= value && 
      is_subtree_lesser?(root.left, value) && 
      is_subtree_lesser?(root.right, value)
      return true
    else
      return false
    end
  end

  def is_subtree_greater?(root, value)
    return true if root.nil?
    if root.value > value && 
      is_subtree_greater?(root.left, value) && 
      is_subtree_greater?(root.right, value)
      return true
    else
      return false
    end
  end

  def insert_left(v)
    if self.left
      self.left.insert(v)
    else
      self.left = Node.new(v)
    end
  end

  def insert_right(v)
    if self.right
      self.right.insert(v)
    else
      self.right = Node.new(v)
    end
  end

  def search_left(v)
    if self.left
      return self.left.search(v)
    else
      return
    end
  end

  def search_right(v)
    if self.right
      return self.right.search(v)
    else
      return
    end
  end

  def delete_left(v)
    if self.left
      self.left = self.left.delete(v)
    else
      return nil
    end
  end

  def delete_right(v)
    if self.right
      self.right = self.right.delete(v)
    else
      return nil
    end
  end
  
end

tree = Node.new(7)

tree.insert(4)
tree.insert(6)
tree.insert(8)
tree.insert(3)
tree.insert(5)

                #         7
                #   4           8
                # 3    6
                    # 5

# binding.pry
# tree.delete(4)
# binding.pry

p "level order_traversal"
tree.level_order_traversal(tree)
p "preorder_traversal"
tree.preorder_traversal(tree)
p "inorder_traversal"
tree.inorder_traversal(tree)
p "postorder_traversal"
tree.postorder_traversal(tree)

p "is BST?"
binding.pry
tree.is_bst?(tree) ? "true" : "false"
