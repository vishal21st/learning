# Definition for singly-linked list.


class ListNode
  attr_accessor :val, :next
  def initialize(val)
      @val = val
      @next = nil
  end
end

# @param {ListNode[]} lists
# @return {ListNode}
def merge_k_lists(lists)
  new_list = nil
  head = nil
  counter = 0
  
  while lists.length > 0
    values = []
    lists.each_with_index do |list|
      values << list.val
      list = list.next
    end
    p values
  end

end

l1 = ListNode.new(1)
l1.next = ListNode.new(2)
l1.next.next = ListNode.new(3)

l2 = ListNode.new(1)
l2.next = ListNode.new(2)
l2.next.next = ListNode.new(3)

l3 = ListNode.new(1)
l3.next = ListNode.new(2)
l3.next.next = ListNode.new(3)

lists = [l1, l2, l3]

merge_k_lists lists
