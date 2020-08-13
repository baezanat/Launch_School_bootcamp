=begin
Write a method that takes a string with one or more space separated words and returns a hash that shows the number of words of different sizes.
Words consist of any string of characters that do not include a space.

Examples:
word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
word_sizes('') == {}

INPUT: string with words separated by a space
OUTPUT: hash with integers
RESTRICTIONS:
  - punctuation counted in word length
  - empty string returns an empty hash
DATA STRUCTURE: string, hash
ALGORITHM:
  - split string to get an array
  - define an empty hash 'sizes'
  - iterate over array and populate the hash with array elements as keys and their sizes as values
=end

def word_sizes(str)
  size_hash = {}
  size_arr = str.split.map { |word| word.size }
  size_arr.each do |size|
    if size_hash.has_key?(size)
      size_hash[size] += 1
    else size_hash[size] = 1
    end
  end
  return size_hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}
