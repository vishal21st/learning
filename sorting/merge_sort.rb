# merge sort
# divide array into 2 and sort both parts and merge back

require 'pry'
def merge(left_array, right_array)
  p left_array
  p right_array
  new_array = []

  nl = left_array.length
  rl = right_array.length
  i = k = j = 0
  while (k < nl && j < rl )
    if (left_array[k] < right_array[j])
      new_array[i] = left_array[k]
      k += 1
    else
      new_array[i] = right_array[j]
      j += 1
    end
    i += 1
  end

  while (k < nl)
    new_array[i] = left_array[k]
    k += 1
    i += 1
  end

  while (j < rl)
    new_array[i] = right_array[j]
    j += 1
    i += 1
  end

  new_array
end

def merge_sort(array)
  
  array_len = array.length
  return array if array_len < 2

  mid = (array_len / 2).to_i

  left_len = mid - 1
  right_len =  array_len - mid

  left_array = []
  right_array = []
  
  for i in 0..left_len do
    left_array[i] = array[i]
  end

  for i in mid..(array_len - 1) do
    right_array[i - mid] = array[i]
  end
  
  left_array = merge_sort(left_array)
  right_array = merge_sort(right_array)
  
  arr = merge(left_array, right_array)
  p arr
  arr
end

merge_sort([3,45,2,90,4,3,2,2342323,456,23,3,2])
