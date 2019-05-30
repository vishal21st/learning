require 'byebug'
def subset(numbers, max)
  results = []
  return [] unless numbers.any?
  find_comb(results, [], numbers, max, 0)
  p results
end

def find_comb(results, combinations, numbers, target, start_index)
  if target.zero?
    results << combinations.clone
    return
  end

  (start_index..numbers.count-1).each do |index|
    combination = numbers[index]
    if target < combination
      next
    end

    combinations << combination

    find_comb(results, combinations, numbers, target - combination, index)
    combinations.pop
  end

end

max = 9
numbers = [1, 3, 5]

subset(numbers, max)