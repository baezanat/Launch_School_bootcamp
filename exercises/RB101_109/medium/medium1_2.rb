=begin
Write a method that can rotate the last n digits of a number. For example:

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917

Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.

INPUT: integer, num
OUTPUT: integer
RULES:
  - Rotate the last num digits of int
  - if num == 1, return int
  - n > 0
  - return same object?
  
ALGORITHM:
  - use #digits.reverse to get an array of digits in the same order as int. Call it digits.
  - initialize variable right = digits[-n..-1]
  - right = right[1..-1] + [right[0]]
  - new_digits = digits[0..-n-1] + right
  - new_digits.join.to_i
=end

def rotate_rightmost_digits(int, num)
  digits = int.digits.reverse
  right = digits[-num..-1]
  right = right[1..-1] + [right[0]]
  new_digits = digits[0..-num - 1] + right
  new_digits.join.to_i
end

p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
