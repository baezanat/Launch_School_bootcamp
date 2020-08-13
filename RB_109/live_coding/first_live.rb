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

INPUT: int
OUTPUT: int (next featured number > int)
RULES:
  - Featured number (num)
    - num.odd?
    - num % 7 == 0
    - For each digit in int, count == 1
  - Find featured num > int such that it's the first featured number > int
  - Error message if there is no featured num > int
DATA STRUCTURE: integers and array
ALGORITHM:
  - Find next multiple of 7 and check if the resulting number is odd and fulfills the uniqueness condition (change to string, then to array, and use uniq)
    - to find next multiple of 7
      - int.divmod(7) = x, y   where x tells us the number of times 7 goes into it, y is the remainder
      - Next multiple of 7 is 7 * x + 7
- return the first number that satisfies all conditions
  - Error message
=end

require 'pry'
require 'pry-byebug'

def featured(int)
  divisor, remainder = int.divmod(7)
  next_multiple = divisor * 7 + 7
  loop do
    digits = next_multiple.to_s.chars
    return next_multiple if next_multiple.odd? && digits.all? { |digit| digits.count(digit) == 1 }
    next_multiple += 7
    p next_multiple
    break if next_multiple >= 9876543210
  end
end


# p featured(12) == 21
# p featured(20) == 21
# p featured(21) == 35
p featured(997) == 1029
# p featured(1029) == 1043
# p featured(999_999) == 1_023_547
# p featured(999_999_987) == 1_023_456_987
