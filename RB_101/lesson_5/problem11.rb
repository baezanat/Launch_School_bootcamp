arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

# use a combination of methods, including either the select or reject method,
# to return a new array identical in structure to the original but containing
# only the integers that are multiples of 3.

=begin
INPUT: array with four inner arrays
OUTPUT: same structure
STRATEGY:
1. Iterate over the array. Current element = inner_array.
2. Call #select on inner_array with a block selecting only multiples of 3.
=end

multiples_of_3_in_arr = arr.map do |sub_array|
  sub_array.select do |num|
    num % 3 == 0
  end
end
p multiples_of_3_in_arr
