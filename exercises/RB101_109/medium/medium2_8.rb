=begin
A featured number (something unique to this exercise) is an odd number that is a multiple of 7, and whose digits occur exactly once each. So, for example, 49 is a featured number, but 98 is not (it is not odd), 97 is not (it is not a multiple of 7), and 133 is not (the digit 3 appears twice).

Write a method that takes a single integer as an argument, and returns the next featured number that is greater than the argument. Issue an error message if there is no next featured number.

Examples:

featured(12) == 21
featured(20) == 21
featured(21) == 35
featured(997) == 1029
featured(1029) == 1043
featured(999_999) == 1_023_547
featured(999_999_987) == 1_023_456_987

featured(9_999_999_999) # -> There is no possible number that fulfills those requirements

INPUT: integer (int)
OUTPUT: integer
RULES:
  - find the first number > int that is
    - odd
    - a multiple of 7
    - has no repeated digits
  - issue error message if there is no number that satisfies these conditions
ALGORITHM:
    - find the first multiple of 7 greater than int
    - (int + 1..int + 7).select { |num| num % 7 == 0 }
    - start loop:
      - check if it satisfies all the conditions
      - return the number if all digits are such that their count == 1
      - otherwise look for the next multiple of 7 (counter += 7)
      - break if next number is >= 9999999999)
    - issue error message
=end

def featured(int)
  num = (int + 1..int + 7).select { |num| num % 7 == 0 }.shift
  loop do
    if num.odd? && num.digits.all? { |digit| num.digits.count(digit) == 1 }
      return num
    else
      num += 7
    end
    break if num >= 9876543210
  end
  puts 'Error'
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

