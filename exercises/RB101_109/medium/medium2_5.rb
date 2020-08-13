=begin
A triangle is classified as follows:

equilateral All 3 sides are of equal length
isosceles 2 sides are of equal length, while the 3rd is different
scalene All 3 sides are of different length

To be a valid triangle, the sum of the lengths of the two shortest sides must be greater than the length of the longest side, and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments, and returns a symbol :equilateral, :isosceles, :scalene, or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.

Examples:

triangle(3, 3, 3) == :equilateral
triangle(3, 3, 1.5) == :isosceles
triangle(3, 4, 5) == :scalene
triangle(0, 3, 3) == :invalid
triangle(3, 1, 1) == :invalid

INPUT: 3 integers
OUTPUT: symbol
RULES:
  - condition1: the sum of the two smallest numbers > largest number
  - condition2: all 3 integers > 0
  - if either condition is not satisfied, return :invalid
  - if these conditions are satisfied, cheeck if
    - if the three numbers are equal, return :equilateral
    - if two of the numbers are equal, return :isoceles
    - if the 3 numbers are different, return :scalene
DATA STRUCTURE: hash and array
ALGORITHM:
  - Create an array with the three given numbers
  - Sort them
  - Use Array#all? to check if they are all > 0, if #all? returns false, then return :invalid
  - array[0] + array[1] > array[2] ----> if this returns false, then return :invalid
  - if array[0] == array[1] && array[1] == array[2] 
    return :equilateral
    elsif array[0] == array[1] || array[1] == array[2] 
    return :isoceles
    else
    return :scalene
=end

def triangle(num1, num2, num3)
  numbers = [num1, num2, num3].sort
  return :invalid if !numbers.all? { |n| n > 0 }
  return :invalid if numbers[0] + numbers[1] <= numbers[2]
  if numbers[0] == numbers[1] && numbers[1] == numbers[2]
    return :equilateral
  elsif (numbers[0] == numbers[1] || numbers[1] == numbers[2]) ||
         numbers[0] == numbers[2]
    return :isosceles
  else
    return :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5)  == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
