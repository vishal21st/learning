

def find_all_combination(arr, reduced_num, num, numbers)
  # p " num -> #{num}"
  # p "reduced_num -> #{reduced_num}"
  # p arr.to_s
  # p "_________________"

  return arr if reduced_num.zero?
  if reduced_num == 1
    # p reduced_num
    arr << 1
    # p arr
    find_all_combination(arr, reduced_num - 1, 1, numbers)
  end

  if reduced_num - num > 0
    arr << num
    arr << find_all_combination(arr, reduced_num - num, num, numbers)
  else
    numbers.each do |m|
      if reduced_num - m > 0
         arr << find_all_combination(arr, reduced_num, m, numbers)
        break
      end
    end

  end
  return arr
end

max = 8
offers = [1, 3, 5]

def main(numbers, max)
  c = []
  numbers.each do |n|
    c << find_all_combination([], max, n, numbers)
  end
 
  p c.to_s
end

main(offers, max)