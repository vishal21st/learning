require_relative "element"
class PriorityQueueNaive
  def initialize
    @elements = []
  end

  def <<(element)
    @elements << element
  end

  def pop
    last_element_index = @elements.size - 1
    @elements.sort!
    @elements.delete_at(last_element_index)
  end
end


queue = PriorityQueueNaive.new
queue << Element.new(4, 4)
queue << Element.new(8,8)
queue << Element.new(10, 10)
queue << Element.new(5, 5)
queue << Element.new(3, 3)
queue << Element.new(0,0)

p queue.pop
p queue.pop
p queue.pop
p queue.pop
p queue.pop
