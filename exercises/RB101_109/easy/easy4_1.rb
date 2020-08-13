=begin
Write a method that takes two strings as arguments, determines the longest of the two
strings, and then returns the result of concatenating the shorter string, the longer
string, and the shorter string once again. You may assume that the strings are of 
different lengths. Examples:
short_long_short('abc', 'defgh') == "abcdefghabc"
short_long_short('abcde', 'fgh') == "fghabcdefgh"
short_long_short('', 'xyz') == "xyz"

INPUT: 2 strings of diff lengths
OUTPUT: string with shorter str + longer str + shorter str
REQUIREMENTS: the empty str counts as the shorter one
  - what about upper case?
TEST CASES: from the examples
ALGORITHM:
  - use #length on both strings to determine their size
  - use concatenation to return a string with desired structure
=end

def short_long_short(str1, str2)
  if str1.length < str2.length
    str1.concat(str2, str1)
  elsif str2.length < str1.length
    str2.concat(str1, str2)
  end
end

p short_long_short('abc', 'defgh') == "abcdefghabc"
p short_long_short('abcde', 'fgh') == "fghabcdefgh"
p short_long_short('', 'xyz') == "xyz"
