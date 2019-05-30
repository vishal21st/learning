
# greedy
class Node
  attr_accessor :value, :adj
  def initialize( value, adj)
    @value = value
    @adj = adj
  end
end

class Graph
  attr_accessor nodes
  def initialize(nodes)
    @nodes = [nil]
    nodes.each_with_index |adj, index|
      @nodes << Node.new(index + 1, adj)
    end
  end
end


def dijikstra
  edge_list = {}
  visited_nodes = {}
  weights = []

end