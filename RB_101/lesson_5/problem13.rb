arr = [[1, 6, 7], [1, 4, 9], [1, 8, 3]]

# return a new array containing the same sub-arrays as the original
# but ordered logically by only taking into consideration the odd numbers
# they contain. The sorted array should be: 
# [[1, 8, 3], [1, 6, 7], [1, 4, 9]]

=begin
INPUT: array with 3 subarrays containing 3 elements each
OUTPUT: array with same structure but sorted
STRATEGY:
1. Use #sort_by method with a block picking the third element of each subarray
=end

sorted = arr.sort_by do |subarray|
  subarray[2]
end
p sorted

# To remain more general and look at the odd numbers (instead of telling the
# program to look at the 3rd elements in each subarray) we could use this
# code instead:

sorted2 = arr.sort_by do |inner_array|
  inner_array.select do |num|
    num.odd?
  end
end
p sorted2
