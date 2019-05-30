#!/bin/ruby
require 'json'
require 'stringio'

ababcdabababacdcdcdcd


n->1 stack [a]
n->2 stack [ab] n-1 != 0 && s[n-1] != s[n] && s[n-2] == s[n] ? insert
n->3 stack [aba]
n -> 4 [abab]
n -> 5  n-1 != 0 && s[n-1] != s[n] && s[n-2] == s[n] ? insert



# Complete the twoCharaters function below.
def twoCharaters(s)
  stacks = [s[0]]
  discarded_set = []
  for i in (1..s.length)
    char = s[i]
    if s[i] == s[i-1] && !char.in?(discarded_set)
      discarded_set << s[i]
    else
      stacks.each do |stack|
        if char != stack[stack.length - 1] && char == stack[stack.length - 2]
          stack << char
        end
      end
    end
  end
  
end



#fptr = File.open(ENV['OUTPUT_PATH'], 'w')

#l = gets.to_i

s = gets.to_s.rstrip

result = twoCharaters s
