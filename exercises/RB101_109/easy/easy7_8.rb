=begin
Write a method that takes two Array arguments in which each Array contains a list of numbers, and returns a new Array that contains the product of each pair of numbers from the arguments that have the same index. You may assume that the arguments contain the same number of elements.
Examples:
multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]

INPUT: 2 arr of int
OUTPUT: 1 arr of int
ALGORITHM:
- zip the arrays to get a two dimensional array
- iterate over the overall array and for each inner array, multiply together all the elements using #map
=end

def multiply_list(arr_1, arr_2)
  arr_1.zip(arr_2).map { |inner_arr| inner_arr.inject(:*) }
end

multiply_list([3, 5, 7], [9, 10, 11]) == [27, 50, 77]
