# Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
# Output: 7 -> 0 -> 8
# Explanation: 342 + 465 = 807.
# Definition for singly-linked list.
require 'pry'
class ListNode
  attr_accessor :val, :next
  def initialize(val)
      @val = val
      @next = nil
  end
end

# @param {ListNode} l1
# @param {ListNode} l2
# @return {ListNode}
def add_two_numbers(l1, l2)
  l3 = nil
  carry_on  = 0
  l3_next  = l3

  while(l1 || l2 || (carry_on != 0))
    
    l1_data =   l1.nil? ? 0 : l1.val 
    l2_data = l2.nil? ? 0 : l2.val

    data = l1_data + l2_data + carry_on
    carry_on = 0
    new_data = data
    if data > 9
      new_data = data % 10
      carry_on = data / 10
    end
    
    
    if l3.nil?
      l3 = ListNode.new(new_data)
      l3_next = l3
    else
      l3_next.next = ListNode.new(new_data)
      l3_next = l3_next.next
    end

    l1 = l1&.next
    l2 = l2&.next

  end

  l3
end

l1 = ListNode.new(5)
# l1.next  = ListNode.new(8)
# l1.next.next = ListNode.new(3)


l2 = ListNode.new(5)
# l2.next  = ListNode.new(6)
# l2.next.next = ListNode.new(4)

add_two_numbers(l1, l2)
