=begin
Write a method that returns true if the string passed as an argument
is a palindrome, false otherwise. A palindrome reads the same forward
and backward. For this exercise, case matters as does punctuation and
spaces. Examples:
palindrome?('madam') == true
palindrome?('Madam') == false          # (case matters)
palindrome?("madam i'm adam") == false # (all characters matter)
palindrome?('356653') == true

INPUT: string
OUTPUT: boolean
REQUIREMENTS:
- Case sensitive
- All characters matter
STRATEGY:
1. Create a method that takes a string as an argument
2. Split string down the middle
  - If string.size is odd, the index for the middle character will be string.size/2 
    (which rounds down). Exlude the middle character and use #slice to 
      get the left and right halves of the string and save them to variables.
  - If string.size is even, split string in half and save the two halves.
    Use #slice and variablee assignment.
3. Use #reverse! on the right half of the string
4. If the left side of the string equal the (reversed) right side of the string,
   return true; otherwise, return false.
=end

def palindrome_str?(str)
  left_str = str[0..str.size/2-1]
  right_str = str[str.size/2+1..str.size-1] if str.size.odd?
  right_str = str[str.size/2..str.size-1] if str.size.even?
  left_str == right_str.reverse! ? true : false
end

# or, much simpler:
def palindrome_str_2?(str)
  string == string.reverse
end

# Write a method that determines whether an array is palindromic:
def palindrome_arr?(arr)
  arr.join == arr.join.reverse
end

# p palindrome_arr?([0, 1, 2, 1, 0]) == true
# p palindrome_arr?(['a', 'b', 'c']) == false
# p palindrome_arr?(['a', 'b', 'c', 'b', 'a']) == true

# write a method that can take either an array or a string argument,
# and determines whether that argument is a palindrome. You may not use
# an if, unless, or case statement or modifier.

def palindrome?(obj)
  obj == obj.reverse
end

p palindrome?([0, 1, 2, 1, 0]) == true
p palindrome?(['a', 'b', 'c']) == false
p palindrome?(['a', 'b', 'c', 'b', 'a']) == true
