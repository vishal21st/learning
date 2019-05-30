# https://www.youtube.com/watch?v=COk73cpQbFQ
# O(nlogn) avg case
# O(n2) worst case
# worst case scenario is prevented by randomising array
# sort func of most library use quick sort


def quick_sort(arr, startIndex , endIndex)
  return if startIndex >= endIndex
  pivot = partition(arr, startIndex, endIndex)
  quick_sort(arr, startIndex, pivot - 1)
  quick_sort(arr, pivot+1, endIndex)
end

def partition(arr, startIndex, endIndex)
  pIndex = 0
  pivotValue = arr[endIndex]

  for i in (0..endIndex - 1)
    if arr[i] <= pivotValue
      swap(arr, i, pIndex)
      pIndex += 1
    end
  end

  swap(arr, pIndex, endIndex)
  return pIndex
end

def swap (arr, index1, index2)
  temp = arr[index1]
  arr[index1] = arr[index2]
  arr[index2] = temp
end

arr = [3,45,2,90,4,3,2,2342323,456,23,3,2]     
quick_sort(arr, 0, 11)
p arr