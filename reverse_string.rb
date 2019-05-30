# @param {String} s
# @return {String}
require 'pry'
def reverse_words(str)
  l_index = 0
  r_index = str.length - 1
  if (r_index > 1)
    str = reverse_string(str, l_index, r_index)
    for i in (0..(str.length))
      if (i == str.length || str[i] == " ")
        str = reverse_string(str, l_index, (i - 1))
        l_index = i + 1;
      end
    end
  end
end

def reverse_string(str, l_index, r_index)
  while l_index < r_index do
    temp = str[l_index]
    str[l_index] = str[r_index]
    str[r_index] = temp
    l_index += 1
    r_index -= 1
  end
  str
end
