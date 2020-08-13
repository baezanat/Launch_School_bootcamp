arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]},
  {e: [8], f: [6, 10]}]

# write some code to return an array which contains only the hashes
# where all the integers are even.

=begin
INPUT: array with three hash elements
OUTPUT: array with only selected hash elements (with only even integers)

STRATEGY:
1. Use #select on arr
    inner_hash.values.select + block for all elements being even
=end

only_even = arr.select do |inner_hash|
  inner_hash.values.flatten.all? do |num|
    num.even?
  end
end

p only_even
