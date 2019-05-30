# Linked List
# Array VS Linked List
# https://www.youtube.com/watch?v=NobHlGUjV3g&list=PL2_aWCzGMAwI3W_JlcBbtYTwiQSsOTa6P&index=3
# https://www.youtube.com/watch?v=lC-yYCOnN8Q&list=PL2_aWCzGMAwI3W_JlcBbtYTwiQSsOTa6P&index=4

# factors like whats the frequent operation and size, through which we check the advantages and disadvanatges for array and LL
# Array is contiguous memory space vs Linked List is not
# Array access in constant time O(1) vs Linked List is O(n)
# Insert in Array is O(n) and Insert in Linked List is O(n)
# Delete is O(n) for both
# Array memory wastage , Linked List no memory wastage
# LL is good for large size data type for example data is of 16 byte and link part is 4 byte then LL is better than Array
# Memory may not be avaible for large array so memory fragmantation issue may come but rare in Array DS, not with LL
# 

require "pry"
class ListNode
  attr_accessor :data, :next

  def initialize(data)
    @data = data
    @next = nil
  end

end


class LinkedList
  attr_accessor :head
  
  def initialize
    @head = nil
  end

  def get_new_node(data)
    ListNode.new(data)
  end

  def add(data)
    node = @head

    pointer = node

    while pointer do
      node = pointer
      pointer = pointer.next
    end
    
    new_node = get_new_node(data)

    if @head.nil?
      @head = new_node
    else 
      node.next = new_node
    end
    # print_node
  end

  def delete(data)
    node = @head
    pointer = node
    
    prev_node = node

    while node.data != data
      prev_node = node
      node = node.next
    end

    if @head == node
      @head = node.next
    else
      prev_node.next = node.next
    end
  end

  def delete_at(pos)
    node = @head
    counter = 0
    prev_node = node
    
    while counter != pos do
      prev_node = node
      node = node.next
      counter += 1
    end

    if prev_node ==  @head
      @head = node.next
    else
      prev_node.next = node.next
    end

  end

  def print_node
    node = @head
    while node do
      p node.data
      node = node.next
    end
  end
end


list = LinkedList.new
list.add(1)
list.add(2)
list.add(3)
list.add(4)
list.add(5)
list.print_node
p '***********'
list.delete_at(3)
list.print_node
