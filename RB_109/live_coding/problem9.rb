# Write a method that takes a positive integer or zero, and converts it to a
# string representation.

# You may not use any of the standard conversion methods available in Ruby, such
# as Integer#to_s, String(), Kernel#format, etc. Your method should do this the
# old-fashioned way and construct the string by analyzing and manipulating the
# number.

=begin
INPUT: integer
OUTPUT: string
RULES:  
  - int >= 0
  - cannot use standard methods
ALGORITHM:
  - Create a conversion hash that goes from int to strings, from 0 to 9
  - Convert the int to an array of integers using #digits.reverse (to keep order)
  - Iterate over the array to convert digits to string using the hash
=end

CONVERSION = { 0 => '0', 1 => '1', 2 => '2', 3 => '3', 4 => '4', 5 => '5', 6 => '6', 7 => '7', 8 => '8', 9 => '9'}

def integer_to_string(int)
  array_strings = (int.digits.reverse. map do |digit|
    CONVERSION[digit]
  end)
  array_strings.join
end

# Examples:
p integer_to_string(4321) == '4321'
p integer_to_string(0) == '0'
p integer_to_string(5000) == '5000'
