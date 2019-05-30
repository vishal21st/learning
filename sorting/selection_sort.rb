# selection sort

# for arr 
#   find min and swap 

class SelectionSort
  def self.sort(arr)
    for i in 0..(arr.length - 2)
      i_min = i
      for j in (i+1)..(arr.length - 1)
        if arr[j] < arr[i_min]
          i_min = j
        end
      end

      temp = arr[i]
      arr[i] = arr[i_min]
      arr[i_min] = temp
    end
    p arr
  end
end


array = [1,5,4,9,10,3]

SelectionSort.sort(array)
