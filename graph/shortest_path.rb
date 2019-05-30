def findShortest(graph_nodes, graph_from, graph_to, ids, val)
  # solve here
  graph = {}
  (1..graph_nodes).each do |index|
    graph[index] = {adj: [], color: -1}
  end

  graph_from.each_with_index do |node, index|
    graph[node][:adj] <<  graph_to[index]
    graph[graph_to[index]][:adj] << node
  end
  
  node_color = val
  start_node = -1

  ids.each_with_index do |color, node|
    graph[node+1][:color] = color
    start_node = node if color == val && start_node == -1
  end

  p graph
end

graph_nodes = 4
edges = 3

graph_from  = [1, 1, 4]
graph_to = [2, 3, 2]
colors = [1, 2, 1, 1]
val = 1 

findShortest(graph_nodes, graph_from, graph_to, colors, val)