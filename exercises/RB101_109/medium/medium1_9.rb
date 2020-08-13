=begin
Fortunately, every recursive method can be rewritten as a non-recursive (procedural) method. Rewrite your recursive fibonacci method so that it computes its results without recursion.

Examples:

fibonacci(20) == 6765
fibonacci(100) == 354224848179261915075
fibonacci(100_001) # => 4202692702.....8285979669707537501

INPUT: int
OUTPUT: int (Fibonacci number at n)
DATA STRUCTURE: numbers and maybe arrays
RULES: Write a procedural method to find the nth fibonacci number
ALGORITHM:
  - need to write a formula to find each number up to the nth number?
  - Initiate an array called series with the first two numbers in the series.
  - Create an array from 3 to n
  - Iterate over the array and calculate fibonacci(num) for each num. Make sure to subtract 1 from indexes in order to account for the off-by-one issue with index numbers.
  - Append each number into a series array.
  - Return the last element in the series array.
=end

def fibonacci(n)
  series = [1, 1]
  (3..n).to_a
  array.each do |num|
    series << series[num - 3] + series[num - 2]
  end
  series.pop
end

p fibonacci(20) == 6765
p fibonacci(100) == 354224848179261915075
# p fibonacci(100_001) # => 4202692702.....8285979669707537501
