=begin
Write a method that returns true if its integer argument is palindromic, false otherwise. A palindromic number reads the same forwards and backwards. Examples:
palindromic_number?(34543) == true
palindromic_number?(123210) == false
palindromic_number?(22) == true
palindromic_number?(5) == true

INPUT = integer
OUTPUT = boolean

REQUIREMENTS:
- return true if integer is palindrome, false otherwise
- 0 counts
- return true if integer is a single digit

ALGORITHM:
- Transform integer into string
- Check if string == string.reverse
=end

def palindromic_number?(num)
  num.to_s == num.to_s.reverse ? true : false
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true

# To deal with integers with leading 0s:
# '0%o' % 0112  # 0: leading zero, %o: represent as an octal
# => "0112"
