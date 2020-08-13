# In this kata you are required to, given a string, replace every letter with its position in the alphabet.

# If anything in the text isn't a letter, ignore it and don't return it.

# "a" = 1, "b" = 2, etc.

# Example
# alphabet_position("The sunset sets at twelve o' clock.")
# Should return "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11" (as a string)
=begin
INPUT: string
OUTPUT: string (of numbers)
RULES:
  - replace every letter with its position in the alphabet
  - a non-letter should be ignored
  - if no letters, return empty string
DATA STRUCTURE: strings and arrays
ALGORITHM:
  - INitialize an array with letters of the alphabet using ('a'..'z').to_a
  - Clean up string, get rid of non-letters
  - Creating array of letters using #chars on input string
  - Iterate over the array using #map.with_index to return a new array with the corresponding digit. Map every element in the array to (alphabet.index(element)) + 1.
  - Use join(' ') to get the string and return it
=end

def alphabet_position(text)
  alphabet = ('a'..'z').to_a
  cleaned_up = text.gsub(/[^a-z]/i, '').downcase
  index_array = (cleaned_up.chars.map.with_index do |char, index|
    alphabet.index(char) + 1
  end)
  index_array.join(' ')
end

# p alphabet_position('a . bc -') 
p alphabet_position("Hello") == "8 5 12 12 15"
p alphabet_position("The sunset sets at twelve o' clock.") == "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11"
p alphabet_position("-.-'") == ""
