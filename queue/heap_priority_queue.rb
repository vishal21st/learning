# https://www.brianstorti.com/implementing-a-priority-queue-in-ruby/
require_relative "element"
class HeapPriorityQueue
  def initialize
    @elements = [nil]
  end

  def <<(element)
    @elements << element
    bubble_up(@elements.size - 1)
  end

  def bubble_up(index)
    parent_index = (index / 2)
    return if parent_index < 1
    return if @elements[parent_index].priority > @elements[index].priority
    exchange(index, parent_index)
    bubble_up(parent_index)
  end

  def bubble_down(index)
    child_index =  index * 2
    return if child_index > @elements.size - 1

    left_child = @elements[child_index]
    right_child = @elements[child_index + 1]

    not_last_elemnt = child_index < @elements.size - 1

    child_index += 1 if not_last_elemnt && left_child < right_child

    return if @elements[index] > @elements[child_index]
    exchange(index, child_index)
    bubble_down(child_index)
  end

  def pop
    exchange(1, @elements.size - 1)
    max = @elements.pop
    bubble_down(1)
    max
  end

  def exchange(source, target)
    @elements[source], @elements[target] = @elements[target], @elements[source]
  end

end


queue = HeapPriorityQueue.new
queue << Element.new(1, 1)
queue << Element.new(2,2)
queue << Element.new(3,3)
queue << Element.new(4,4)
queue << Element.new(9, 9)
queue << Element.new(5, 5)
queue << Element.new(6, 6)

# p queue
p queue.pop
p queue.pop
p queue.pop
p queue.pop
p queue.pop
