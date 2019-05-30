#!/bin/ruby

require 'json'
require 'stringio'


# Complete the camelcase function below.
CAPITALS = {
  A: true,
  B: true,
  C: true,
  D: true,
  E: true,
  F: true,
  G: true,
  H: true,
  I: true,
  J: true,
  K: true,
  L: true,
  M: true,
  N: true,
  O: true,
  P: true,
  Q: true,
  R: true,
  S: true,
  T: true,
  U: true,
  V: true,
  W: true,
  X: true,
  Y: true,
  Z: true
}

def camelcase(s)
  n = 0
  length = s.length
  return n if length.zero?

  for i in (0..length-1)
    char = s[i]
    if i == 0 && !(CAPITALS[char.to_sym])
      n = 1 
    else
      char = s[i]
      n = n + 1 if (CAPITALS[char.to_sym])
    end
  end
  n
end

def read_file(file_name)
  s = ""
  File.open(file_name).each do |line|
    s = s + line
  end
  s
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

s = gets.to_s.rstrip

result = camelcase s

fptr.write result
fptr.write "\n"

fptr.close()