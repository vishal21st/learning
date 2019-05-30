# "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"

# @param {Integer} num
# @return {String}
require "pry"
ONES = ["", " One", " Two", " Three", " Four", " Five", " Six", " Seven", " Eight", " Nine", " Ten"]
TENS = ["", " Eleven", " Twelve", " Thirteen", " Fourteen", " Fifteen", " Sixteen", " Seventeen", " Eighteen", " Nineteen"]
TWENTIES = ["", "", " Twenty", " Thirty", " Forty", " Fifty", " Sixty", " Seventy", " Eighty", " Ninety"]

def number_to_words(num)
  thousands = ["", "Billion", "Million", "Thousand"]
  num_word = ""
  if num == 0
    return "Zero"
  end

  if num >= 1000000000
    i = (num / 1000000000).to_i
    num_word = num_word + ONES[i] + " Billion"
    num = num % 1000000000
  end

  if num >= 1000000
    i = (num / 1000000).to_i
    num_word = num_word + convert_hundreds(i) + " Million"
    num = num % 1000000
  end

  if num >= 1000
    i = (num / 1000).to_i
    num_word = num_word + convert_hundreds(i) + " Thousand"
    num = num % 1000
  end

  num_word = num_word + convert_hundreds(num)

  num_word.strip
end

def convert_hundreds(num)
  num_word = ""
  if num > 99
    binding.pry
    i = (num / 100).to_i
    if i > 10
      i = i % 10
      num_word = num_word + TENS[i] + " Hundred"
    else
      num_word = num_word + ONES[i] + " Hundred"
    end
    num = num % 100
  end
  
  if num < 20 && num > 10
    i = num % 10
    num_word = num_word + TENS[i]
    return num_word
  end
  
  if num >= 20
    i = (num / 10).to_i
    num_word = num_word + TWENTIES[i]
    num = num % 10
  end

  if num <= 10
    num_word = num_word + ONES[num]
  end

  num_word
end


number_to_words(1000)
# "One Billion Two Hundred Thirty Four Million Five Hundred Sixty Seven Thousand Eight Hundred Ninety One"
# convert_hundreds(0)
