# Bubbule sort
# take the max and push it to right

def bubble_sort(arr)
  switch = true
  length = arr.length - 1
  swap_count = 0
  while switch do
    switch = false
    for i in (1..length) do
      if arr[i] < arr[i - 1]
        swap += 1
        switch = true
        temp = arr[i]
        arr[i] = arr[i - 1]
        arr[i - 1] = temp
      end
    end
    break if switch == false
    length = length - 1
    p arr
  end
end


arr = [1,45,5,34,2,4]

bubble_sort arr