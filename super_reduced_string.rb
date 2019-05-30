#!/bin/ruby

require 'json'
require 'stringio'

# Complete the super_reduced_string function below.


def slice(s, start , end_pos)
  s[start, end_pos] = ""
  s
end

def super_reduced_string(s, start)
  length = s.length
  if length == 0
    "Empty String"
  elsif start >= length - 1
    s
  elsif s[start] == s[start + 1] 
    s = slice(s, start, 2)
    super_reduced_string(s, 0)
  else
    start = start + 1
    super_reduced_string(s, start)
  end
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.to_s.rstrip

result = super_reduced_string(s, 0)

fptr.write result
fptr.write "\n"

fptr.close()
