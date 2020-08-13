=begin
Given a string that consists of some words and an assortment of non-alphabetic characters, write a method that returns that string with all of the
non-alphabetic characters replaced by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in the result 
(the result should never have consecutive spaces).

Examples:
cleanup("---what's my +*& line?") == ' what s my line '

INPUT: str with words and non-alphabetic chars
OUTPUT: str with words and spaces in place of non-alphabetic chars
RESTRICTIONS: non-repeated spaces
DATA STRUCTURE: STRING
ALGORITHM:
  - Use regex to replace all non-alphabetic chars with a space
  - Iterate over the string and, if there is a space, delete any spaces to its right until there are no other spaces left.
=end

def cleanup(str)
  str.gsub(/[^a-z]/i, ' ').squeeze(' ')
end

cleanup("---what's my +*& line?") == ' what s my line '
cleanup('alalala')
