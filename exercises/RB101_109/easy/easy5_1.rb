=begin
Write a method that determines and returns the ASCII string value of a string that is passed in as an argument. The ASCII string value is the sum of the ASCII values of every character in the string. (You may use String#ord to determine the ASCII value of a character.)
examples:
ascii_value('Four score') == 984
ascii_value('Launch School') == 1251
ascii_value('a') == 97
ascii_value('') == 0

INPUT: string
OUTPUT: integer
RESTRICTIONS: use #ord to determine ASCII value of character
DATA STRUCTURE: array
STRATEGY:
- iterate over string and get ASCII value for each character
- use #sum or #reduce on array 
=end

def ascii_value(str)
  char_array = str.chars
  char_array.map { |char| char.ord }.sum
end

p ascii_value('Four score') == 984
p ascii_value('Launch School') == 1251
p ascii_value('a') == 97
p ascii_value('') == 0
