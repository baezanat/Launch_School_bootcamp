=begin
The Fibonacci series is a series of numbers (1, 1, 2, 3, 5, 8, 13, 21, ...) such that the first 2 numbers are 1 by definition, and each subsequent number is the sum of the two previous numbers. This series appears throughout the natural world.

Computationally, the Fibonacci series is a very simple series, but the results grow at an incredibly rapid rate. For example, the 100th Fibonacci number is 354,224,848,179,261,915,075 -- that's enormous, especially considering that it takes 6 iterations before it generates the first 2 digit number.

Write a method that calculates and returns the index of the first Fibonacci number that has the number of digits specified as an argument. (The first Fibonacci number has index 1.)

Examples:
find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
find_fibonacci_index_by_length(10) == 45
find_fibonacci_index_by_length(100) == 476
find_fibonacci_index_by_length(1000) == 4782
find_fibonacci_index_by_length(10000) == 47847

INPUT: int (length of number)
OUTPUT: int (index of 1st number with that length in the series)
COMMENTS: What to do with 0 and negative numbers?
DATA STRUCTURE: array
ALGORITHM:
  - Write algorithm for generating the fib series as an array
  - Use #find_index and #length to find the index of the first element of a certain array
=end

def find_fibonacci_index_by_length(length)
  fibonacci = [1, 1]
  if length == 0
    'error'
  elsif length == 1
    1
  else
    n = 2
    loop do
      fibonacci[n] = fibonacci[n-1] + fibonacci[n - 2]
      break if fibonacci[n].to_s.length >= length
      n += 1
    end
    n + 1
  end
end

p find_fibonacci_index_by_length(0)
p find_fibonacci_index_by_length(2) == 7
p find_fibonacci_index_by_length(3) == 12
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847
