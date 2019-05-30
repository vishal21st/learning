class Node
  attr_accessor :edges, :name
  def initialize(name)
    @edges = []
    @name = name
  end

  def add_edge(node)
    @edges << node
  end
end

def dependency_resolution(node)
  resolved_nodes = []
  resolve_dependency(node, resolved_nodes)
  resolved_nodes.each do |n|
    p n.name
  end
end

def resolve_dependency(node, resolved_nodes)
  node.edges.each do |edge|
    unless resolved_nodes.include?(edge)
      resolve_dependency(edge, resolved_nodes)
    end
  end

  resolved_nodes << node
end

a = Node.new('a')
b = Node.new('b')
c = Node.new('c')
d = Node.new('d')
e = Node.new('e')



a.add_edge(b)    # a depends on b
a.add_edge(d)    # a depends on d
b.add_edge(c)    # b depends on c
b.add_edge(e)    # b depends on e
c.add_edge(d)    # c depends on d
c.add_edge(e)

dependency_resolution(a)