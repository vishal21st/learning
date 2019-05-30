require 'byebug'
def max_str(str)
  arr = str.split('')

  temp_str = ""
  max_str = ""
  str_len = arr.length
  index = 0
  while index < str_len 
    
    last_char = temp_str[temp_str.length-1]
    next_char = arr[index]
    
    last_index_of_occurence = temp_str.rindex(next_char)

    unless last_index_of_occurence.nil?
      
      # p "**********"
      # p temp_str
      # p temp_str
      
      
      if (last_index_of_occurence < temp_str.length - 1)
      temp_str = temp_str[last_index_of_occurence+1...temp_str.length] + next_char
      else
        temp_str = last_char 
      end
      
    else
      temp_str = temp_str + next_char
      if temp_str.length > max_str.length
        max_str = temp_str.clone
      end
    end
    index += 1
  end
  return max_str
end

p max_str("helloworld")
p max_str("cccwffg")
p max_str("cccccccc")
p max_str("cccccccc")
p max_str("")
p max_str("acccccccca")
p max_str("aaccccccccaa")
p max_str("aabdccccccccab")
p max_str("abcabcabcabc")
