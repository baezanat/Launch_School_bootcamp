=begin
Write a method that takes a positive integer as an argument and returns that number with its digits reversed. Examples:

reversed_number(12345) == 54321
reversed_number(12213) == 31221
reversed_number(456) == 654
reversed_number(12000) == 21 # No leading zeros in return value!
reversed_number(12003) == 30021
reversed_number(1) == 1

Don't worry about arguments with leading zeros - Ruby sees those as octal numbers, which will cause confusing results. For similar reasons, the return value for our fourth example doesn't have any leading zeros.

INPUT: int
OUTPUT: int with digits reversed
DATA STRUCTURE: array
RESTRICTIONS:
  - no leading zeroes
ALGORITHM:
  - Transform int to string
  - Reverse
  - Change back to int
=end

def reversed_number(int)
  int.to_s.reverse.to_i   # => 54321, 31221, 654, 21, 30021, 1
end                       # => :reversed_number

reversed_number(12345) == 54321  # => true
reversed_number(12213) == 31221  # => true
reversed_number(456) == 654      # => true
reversed_number(12000) == 21     # => true
reversed_number(12003) == 30021  # => true
reversed_number(1) == 1          # => true
