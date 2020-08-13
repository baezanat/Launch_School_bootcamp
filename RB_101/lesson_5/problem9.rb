arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

# Given this data structure, return a new array of the same structure
# but with the sub arrays being ordered (alphabetically or numerically
# as appropriate) in descending order.

=begin
INPUT: array with three inner arrays with 3 elements each
OUTPUT: array with same structure but sorted
STRATEGY:
1. Iterate over the outer array. Use map so the return value
   is the new array. Current element = inner array.
2. Sort each inner array and reverse.
3. Return new array.
=end

sorted = arr.map do |inner_array|
  inner_array.sort.reverse
end

p sorted
