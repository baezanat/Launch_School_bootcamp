=begin
Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array. You may assume that the Array always contains at least one number.

Examples:

sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
sum_of_sums([4]) == 4
sum_of_sums([1, 2, 3, 4, 5]) == 35

INPUT: array of integers
OUTPUT: int
RESTRICTIONS:
  - return sum of first num + sum of first two num + sum of first 3 num, etc
  - if input is single element arr, return the element
STRATEGY: 
  - Iterate over array
  . for each element, return the sum of all elements up to it
  - reduce the resulting array as a sum
=end

def sum_of_sums(arr)
  step_sums = arr.map.with_index do |num, idx|
    arr[0..idx].sum
  end
  step_sums.sum
end

sum_of_sums([1, 2, 3]) # => 10
sum_of_sums([3, 5, 2]) # => 21
sum_of_sums([1, 5, 7, 3]) # => 36
sum_of_sums([4]) # => 4
sum_of_sums([1, 2, 3, 4, 5]) # => 35
