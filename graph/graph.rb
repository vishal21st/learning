
class Node
  attr_accessor :index, :adj, :weight, :color
  def initialize( index, weight, adj, color)
    @index = index
    @adj = adj
    @weight = weight
    @color = color
  end
end

class Graph
  attr_accessor :nodes
  def initialize()
    @nodes = [nil]
  end

  def add_node(index, weight, adj, color)
    @nodes << Node.new(index, weight, adj, color)
  end

  def get_node(index)
    nodes[index]
  end
end
