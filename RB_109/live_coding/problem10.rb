# The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...)
# such that the first 2 numbers are 1 by definition, and each subsequent number
# is the sum of the two previous numbers. This series appears throughout the
# natural world.

# Computationally, the Fibonacci series is a very simple series, but the results
# grow at an incredibly rapid rate. For example, the 100th Fibonacci number is
# 354,224,848,179,261,915,075 -- that's enormous, especially considering that it
# takes 6 iterations before it generates the first 2 digit number.

# Write a method that calculates and returns the index of the first Fibonacci
# number that has the number of digits specified as an argument. (The first
# Fibonacci number has index 1.)

# You may assume that the argument is always greater than or equal to 2.
=begin
INPUT: int (number of digits)
OUTPUT: num (index of the first F number with int digits)
RULES:
  - F series:
    + index == 1, num == 1
    + index == 2, num == 1
    + index == 3, num == 2
    + index == 4, num == 3
    etc
  - need to return index for num with int digits
    (num will always have 2 or more digits)
ALGORITHM:
  - We need to construct the F series up to a number with length int.size.
    Then return the index of that F number
  
end

=end

def find_fibonacci_index_by_length(int)
  series = [0, 1, 1]
  loop do
    series << series[-1] + series[-2]
    break if series[-1].to_s.size == int
  end
  series.index(series[-1])
end


# Examples:
p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
