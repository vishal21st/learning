require 'pry'
def find_common_numbers(a1, a2)
  iterable = a1
  hashable = a2
  if a1.length < a2.length
    iterable = a2
    hashable = a1
  end
  hash = {}
  hashable.each do |key|
    p key
    hash[key] = false
  end
  
  p hash

  iterable.each do |key, val|
    if hash.include? key
      hash[key] = true
    end
  end
  
  p hash
end

a1 = [1,2,3,4,5,67]
a2 = [2]
find_common_numbers(a1, a2)
