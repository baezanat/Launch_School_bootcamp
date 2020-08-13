=begin
If you take a number like 735291, and rotate it to the left, you get 352917. If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175. Keep the first 2 digits fixed in place and rotate again to 321759. Keep the first 3 digits fixed in place and rotate again to get 321597. Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579. The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument. You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

Example:

max_rotation(735291) == 321579
max_rotation(3) == 3
max_rotation(35) == 53
max_rotation(105) == 15 # the leading zero gets dropped
max_rotation(8_703_529_146) == 7_321_609_845

INPUT: int
OUTPUT: int
DATA STRUCTURE: array
RULES:
  - 1st rotation: rotate whole number
  - 2nd rotation: rotate elements from index 1 to -1 and append to element at index 0
  - 3rd rotation:                      index 2 to -1                     from 0 to 1
  - 4th rotation:                      index 3 to -1                     from 0 to 2
  - do it until you rotate elems from  index -2 to -1                    from 0 to -3
ALGORITHM:
  - use #digits.reverse to convert the input int to an array of digits in the same order as int. 
    call it digits.
  - iterate over digits and call rotate_rightmost_digits(digit, n), where n begins at array.size and decreases by one until it is equal to 1.
  - return the transformed array, join it and use #to_i.
=end

def rotate_rightmost_digits(int, num)
  digits = int.digits.reverse
  right = digits[-num..-1]
  right = right[1..-1] + [right[0]]
  new_digits = digits[0..-num - 1] + right
  new_digits.join.to_i
end

def max_rotation(int)
  result = int
  n = int.digits.size
  n.times do
    result = rotate_rightmost_digits(result, n)
    n -= 1
  end
  result
end

p max_rotation(735291) == 321579
p max_rotation(3) == 3 # => false
p max_rotation(35) == 53 # => false
p max_rotation(105) == 15 # the leading zero gets dropped # =>  # => 
p max_rotation(8_703_529_146) == 7_321_609_845 # => 

