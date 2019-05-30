# https://www.hackerrank.com/challenges/torque-and-development/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=graphs
require 'pry'
def road_n_libraries(n, m, c_lib, c_road, edges)
  nodes = []
  visited_nodes = {}
  
  cities = {}
  cost = 0
  (1..n).each do |index|
    cities[index] = []
  end

  edges.each do |arr|
    node1 = arr[0]
    node2 = arr[1]
    cities[node1].push node2
    cities[node2].push node1
  end

  cities.each do |city, edges|
    if visited_nodes[city].nil?
      connected_nodes = []
      queue = [city]
      dfs(queue, cities, visited_nodes, connected_nodes)
      cost_road_lib = c_lib + c_road * (connected_nodes.count - 1)
      lib_cost = c_lib * connected_nodes.count

      if lib_cost < cost_road_lib
        cost += lib_cost
      else
        cost += cost_road_lib
      end
      
    end
  end
  
  p cost
end

def dfs(queue, nodes, visited_nodes, connected_nodes)
  if queue.empty?
    return connected_nodes
  else
    node = queue.pop
    if !visited_nodes[node]
      connected_nodes.push node
      visited_nodes[node] = true
      if nodes[node]
        nodes[node].each do |v|
          queue << v
        end
      end
    end
  end
  dfs(queue, nodes, visited_nodes, connected_nodes)
end


# # 6 4 2 3
# n = 6
# m = 4
# c_lib = 2
# c_road = 3
# cities = [
#   [1,2],
#   [1,3],
#   [4,5],
#   [4,6]
# ]


# road_n_libraries(n, m, c_lib, c_road, cities)


fptr = File.open('test_case.text', 'w')

q = gets.to_i

q.times do |q_itr|
    nmC_libC_road = gets.rstrip.split

    n = nmC_libC_road[0].to_i

    m = nmC_libC_road[1].to_i

    c_lib = nmC_libC_road[2].to_i

    c_road = nmC_libC_road[3].to_i

    cities = Array.new(m)

    m.times do |i|
        cities[i] = gets.rstrip.split(' ').map(&:to_i)
    end

    result = roadsAndLibraries n, c_lib, c_road, cities

    p result
    
end

fptr.close()