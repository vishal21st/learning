require 'byebug'
sum = 0

def find_max(cost, number_of_choc, no_of_wrapper_for_once_choc, sum)

  if number_of_choc < no_of_wrapper_for_once_choc 
    return sum
  end
  
  sum += ( number_of_choc / no_of_wrapper_for_once_choc).to_i

  if number_of_choc % no_of_wrapper_for_once_choc == 0
    number_of_choc = number_of_choc / no_of_wrapper_for_once_choc
  else
    number_of_choc =( number_of_choc / no_of_wrapper_for_once_choc).to_i +  number_of_choc % no_of_wrapper_for_once_choc
  end
  find_max(cost, number_of_choc, no_of_wrapper_for_once_choc, sum)
end


p find_max(1, 15, 3, 15)


15
5
1
1