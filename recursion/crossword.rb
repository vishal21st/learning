require 'byebug'
crossword = [
'XXXXXX-XXX',
'XX------XX',
'XXXXXX-XXX',
'XXXXXX-XXX',
'XXX------X',
'XXXXXX-X-X',
'XXXXXX-X-X',
'XXXXXXXX-X',
'XXXXXXXX-X',
'XXXXXXXX-X'
]

words = ["ICELAND", "MEXICO", "PANAMA", "ALMATY"]

# for each word check horizontal and vertical if present update


def crossword_problem(rows, words)
  row_length = rows.length
  col_length = rows.first.length
  crossword = Array.new(row_length){Array.new(col_length, "X")}
  
  rows.each_with_index do |row, row_index|
    row = row.split('')
    row.each_with_index do |v, column_index|
      crossword[row_index][column_index] = v
    end
  end

  words.each do |word|
   match_horizonatlly(crossword, word, 0, row_length, col_length)
  end

  p print_matrix(crossword)
end

def match_horizonatlly(crossword, word, next_row, row_length, col_length)
  return if next_row >= row_length
  column_index = 0
  
  crossword_str = crossword[next_row].join('')
  placeholder = '-' * word.length
  index_found = crossword_str.index(placeholder)
  unless index_found.nil?
    crossword_str.sub! placeholder, word
    crossword[next_row] = crossword_str.split('')
    return 
  end
  
  next_row  += 1
  match_horizonatlly(crossword, word, next_row, row_length, col_length)
  print_matrix(crossword)
end

def match_vertically(crossword, word, next_column, row_length, col_length)
  return if next_column >= col_length
  crossword_str = crossword.map{|a| a[next_column]}.join('')

  placeholder = '-' * word.length
  index_found = crossword_str.index(placeholder)
  unless index_found.nil?
    crossword_str.sub! placeholder, word
    crossword_str = crossword_str.split('')
    crossword_str.each_with_index do |v, index|
      crossword[index][next_column] = v
    end
    return
  end
  
  next_column  += 1
  match_vertically(crossword, word, next_column, row_length, col_length)
end

def print_matrix(crossword)
  return crossword.map{|a| a.join('')}
end

crossword_problem(crossword, words)