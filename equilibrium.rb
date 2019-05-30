require 'pry'
def find_equilibrium(input)
  indexes = []
  input.each_with_index do |value, index|
    value_left = 0
    value_right = 0

    if (index == 0)
      value_left = 0
    else
      value_left = input.slice(0, index).sum
    end

    if (index == input.count - 1) 
      value_right = 0
     else 
      value_right = input.slice(index + 1, (input.count - 1)).sum
    end

    if ((value_left - value_right)  == 0)
      indexes.push(index)
    end

  end
  p "input #{input}"
  p "output #{indexes}"
end


input1 = [3, -2, 2, 0, 3, 4, -6, 3, 5, -4, 8]
input2 = [9, 0, -5, -4, 1, 4, -4, -9, 0, -7, -1]
input3 = [9, -7, 6, -8, 3, -9, -5, 3, -6, -8, 5]
find_equilibrium(input1)
find_equilibrium(input2)
find_equilibrium(input3)
