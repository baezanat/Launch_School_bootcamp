# Write a method that takes one argument, a positive integer,
# and returns a list of the digits in the number.
# Examples:
# puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
# puts digit_list(7) == [7]                     # => true
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
# puts digit_list(444) == [4, 4, 4]             # => true

=begin
INPUT: positive integer
OUTPUT: array of integers between 0 and 9
STRATEGY:
- Write a method that takes an integer as argument and
- changes it to a string
- splits the string into characters with #chars, getting an array with single string characters (numbers)
- iterates over the array and changes the strings back to integers
- returns the array of integers
=end

def digit_list(num)
  arr = num.to_s.chars.map(&:to_i)
end

# Note: (&:to_i is shorthand for something.map { |char| char.to_i })

p digit_list(12345)
p digit_list(7)
p digit_list(375290)
