=begin
Write a method that takes one argument, a string containing one or more words, and
returns the given string with words that contain five or more characters reversed.
Each string will consist of only letters and spaces. Spaces should be included only
when more than one word is present. Examples:
puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

INPUT: string
OUTPUT: string
LIMITATIONS:
- spaces included only when more than one word
- only words with 5 or more characters are reversed

STRATEGY:
1. Create a method that takes a string and
2. Splits it around spaces, to get an array with the words in the string.
3. Iterate over the elements in the array (words) with #each (not #map b/c returns nil if there is
   no transformation) and
4. if word.length >= 5, word.reverse!
5. Make sure you're returning the resulting string.
=end

def reverse_words(str)
  arr = str.split(' ').each {|word| word.reverse! if word.length >= 5}
  arr.join(' ')
end

puts reverse_words('Professional')
puts reverse_words('Walk around the block')
puts reverse_words('Launch School')
