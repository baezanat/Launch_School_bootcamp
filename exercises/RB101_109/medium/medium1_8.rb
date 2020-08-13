=begin # =>  # => 
Write a recursive method that computes the nth Fibonacci number, where nth is an argument to the method.
examples:
fibonacci(1) == 1
fibonacci(2) == 1
fibonacci(3) == 2
fibonacci(4) == 3
fibonacci(5) == 5
fibonacci(12) == 144
fibonacci(20) == 6765

INPUT: int
OUTPUT: int (Fibonacci number)
RULES:
  - Fibonacci series
  - Output should be nth Fibonacci number (nth number in the series/ number at index n-1 in the series)
  - What to do if n is <= 0?
DATA STRUCTURE: numbers and arrays
ALGORITHM:
  - Fibonacci series:
    - if n == 1, F(n) == 1
    - if n == 2, F(n) == 1
    - if n == 3, F(n) == F(n-2) + F(n-1)
  - Define the cases for n == 1 and n==2
  - Create an array from 3 to n
  - Iterate over the array
  - For 
=end

def fibonacci(n)
  if n == 1 || n== 2
    1
  else
    fibonacci(n - 2) + fibonacci(n - 1)
  end
end

fibonacci(1) == 1 # => true
fibonacci(2) == 1 # => true
fibonacci(3) == 2 # => true
fibonacci(4) == 3 # => true
fibonacci(5) == 5 # => true
fibonacci(12) == 144 # => true
fibonacci(20) == 6765 # => true
