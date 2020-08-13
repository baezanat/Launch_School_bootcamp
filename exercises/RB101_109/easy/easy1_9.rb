=begin
Write a method that takes one argument, a positive integer, and returns the sum of its digits

INPUT: positive integer
OUTPUT: positive integer
REQUIREMENTS: result is sum of input's digits
- What to do if the input is int <= 0?

STRATEGY:
1. Create a method that takes the integer
2. Converts it to a string
3. Splits it into each digit using #chars
4. Iterates over the array to convert each character to an integer
5. calls #sum on the array
=end

def sum(int)
  int.to_s.chars.map(&:to_i).sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45
