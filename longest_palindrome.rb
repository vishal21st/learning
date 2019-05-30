# https://www.youtube.com/watch?v=nbTSfrEfo6M
# https://leetcode.com/explore/interview/card/amazon/76/array-and-strings/481/
# @param {String} s
# @return {String}
require 'pry'
def longest_palindrome(s)
  string = s.split("")
  string = preprocess_string(string)
  center = 0
  right = 0
  
  p = []
  ps = ["$"]
  string.length.times{p << 0}

  for i in 1..(string.length - 1 )
    new_s = ""
    mirr = 2*center - i
    
    new_s =  string[i]
    p[i] = [p[mirr], (right - i)].min if (i < right)
    
    while (string[i + 1 + p[i]] == string[i - 1 - p[i]]) do
      new_s = string[i + 1 + p[i]] + new_s + string[i - 1 - p[i]]
      p[i] = p[i] + 1
    end

    if ((p[i] + i) > right)
      center = i 
      right = p[i] + i
    end
  end
  center = p.each_with_index.max[1]
  len = p[center]
  s.slice((center - len)/2 , len)
end

def preprocess_string(s)
  new_string = []
  s.each do |char|
    new_string << '$'
    new_string << char
  end
  new_string << '$'
end

# def get_max_pallindrom(weighted_array, pallindrom_array)
#   pallindrom_array[weighted_array.index(weighted_array.max)].gsub("$", "")
# end

s = "abab"
longest_palindrome s
# find mirror (2*c - 1 )

# IF i < r contained inside pallindrom
# p[i] = take min(r-i, p[mirr])

 # now expand
 # while (i + 1 + p[i]) == (i - 1 - p[i])
  # p[i] ++

# if p[i] goes beyod r

# p[i] + i > r
  # change centre to i
    # c = i
  # change r to p[i] + r
  # r = p[i] + i



