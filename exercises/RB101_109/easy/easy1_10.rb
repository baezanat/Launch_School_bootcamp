=begin
Write a method that takes two arguments, a positive integer and a boolean,
and calculates the bonus for a given salary. If the boolean is true, the bonus
should be half of the salary. If the boolean is false, the bonus should be 0.
Examples (should evaluate true):
puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000

INPUT: positive int and boolean
OUTPUT: integer
REQUIREMENTS:
STRATEGY:
1. Create a method with two arguments (int and boolean)
2. use a ternary operator. boolean ? int/2 : 0
=end

def calculate_bonus(salary, bonus)
  bonus ? salary/2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
