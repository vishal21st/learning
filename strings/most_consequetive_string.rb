# s = aaabccccc


def most_consequetive_num(s)
  hash = {}
  counter = 1
  1.step(s.length , 1) do |i|
    if s[i] == s[i-1]
      counter = counter + 1
    else
      if hash[s[i-1]].nil?
        hash[s[i-1]] = counter
      else
        hash[s[i-1]] = [hash[s[i-1]], counter].max
      end
      counter = 1
    end
  end
  max = 0
  result = ""
  hash.each do |key, val|
    if max < val
      result = key
      max = val
    end
  end
  p result
end

most_consequetive_num("aaassssssssssbccccc")