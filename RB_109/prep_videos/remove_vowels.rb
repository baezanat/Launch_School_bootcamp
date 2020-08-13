=begin
Write a method that takes an array of strings, and returns an array of the same string values, except with the vowels removed.
Example:
input: Write a list of words: green, yellow, black, white
output: List of modified words are: grn, yllw, blck, wht

INPUT: array of strings
OUTPUT: array of modified strings (vowels removed)
RULES:
  - output same as input but with vowels removed from strings
  - empty string returns empty string
DATA STRUCTURE: strings and arrays
ALGORITHM:
  - Iterate over input array use Array#map
  - use gsub on the current string to substitute all vowels with '' (use regex)
=end

def remove_vowels(array)
  array.map do |word|
    word.gsub(/[aeiou]/i, '')
  end
end

p remove_vowels(['green', 'yellow', 'black', 'white'])
p remove_vowels([''])
