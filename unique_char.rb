#!/bin/ruby
require 'json'
require 'stringio'

def first_uniq_char(s)
  return -1 if s.empty?
  len = s.length
  return 0 if (len == 1)
  chars = s.split('')
  char_hash = {}
  for i in (0..(s.length - 1))
    char = chars[i]
    if (i == 0)
      char_hash[char] =  {count: 1, index: i} 
      next
    end
    if char_hash[char]
      char_hash[char][:count] += 1
    else
      char_hash[char] =  {count: 1, index: i}
    end
  end

  # select char with count 1

  chars_with_count_one = char_hash.select{ |c, v| v[:count] == 1}
  return -1 if chars_with_count_one.empty?
  index = nil
  chars_with_count_one.each do |key, char|
    index = char[:index] if index.nil? || index > char[:index]
  end

  index
end


s = gets.to_s.rstrip

first_uniq_char s
