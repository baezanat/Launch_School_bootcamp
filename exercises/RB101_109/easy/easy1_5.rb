=begin
 Write a method that takes one argument, a string, and returns a new
 string with the words in reverse order. examples (should return true):
 puts reverse_sentence('') == ''
 puts reverse_sentence('Hello World') == 'World Hello'
 puts reverse_sentence('Reverse these words') == 'words these Reverse'

INPUT: string
OUTPUT: string with words in reverse order

REQUIREMENTS:
- empty string returns and empty string
- not specified whether it needs to be the same string or not

STRATEGY:
1. Create method that
2. uses #split to get an array with the words from the string
3. Iterates over the array and reverses each word
4. Joins the words into a new string (separated by a space)
=end

def reverse_sentence(str)
  str.split.reverse!.join(' ')
end

puts reverse_sentence('I am happy')
puts reverse_sentence('') == ''
puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
