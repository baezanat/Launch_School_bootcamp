=begin
An isogram is a word that has no repeating letters, consecutive or non-consecutive. Implement a function that determines
whether a string that contains only letters is an isogram. Assume the empty string is an isogram. Ignore letter case.

is_isogram("Dermatoglyphics" ) == true
is_isogram("aba" ) == false
is_isogram("moOse" ) == false # -- ignore letter case

INPUT: string
OUTPUT: boolean
RULES:
  - Conditions for returning true:
     no repeated letters
  - String contains only letters
  - Empty string returns true
  - Case insensitive
ALGORITHM:
  - Make a copy of the string and call String#chars to turn it into an array, Array#uniq to get rid of any repeated letters 
    and Array#join to turn it back into a string
  - Compare copy and input string. If they are equal, return true. Otherwise, return false.
=end

def is_isogram(str)
  comparison_str = str.dup.downcase.chars.uniq.join
  return true if str.downcase == comparison_str
  false
end

p is_isogram("Dermatoglyphics" ) #== true
p is_isogram("aba" ) == false
p is_isogram("moOse" ) == false # -- ignore letter case
