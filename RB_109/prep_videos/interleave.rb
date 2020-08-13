=begin
Write a method that combines two arrays passed in as arguments, and returns a new array that contains all elements from both arguments, with the elements taken in alternation.
You may assume that both input arrays are non-empty, and that they have the same number of elements.
Example:
interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']

INPUT: arr1, arr2
OUTPUT: array
RULES:
  - combine both arrays element-wise
  - same numbeer of elements
  - non-empty
DATA STRUCTURE: arrays
ALGORITHM:
  - Initialize an empty result array
  - Iterate with index over arr1
    - for each element with index i in arr1, append it to result array at index i*2
  - Iterate with index over arr2
    - for each element with index i in arr2, append it to result array at index 1+ i*2
  - return result array
=end

def interleave1(arr1, arr2)
  arr1.zip(arr2).flatten
end

def interleave(arr1, arr2)
  result = []
  arr1.each_with_index do |element, index|
    result[index * 2] = element
  end
  arr2.each_with_index do |element, index|
    result[(index * 2) + 1] = element
  end
  result
end


p interleave([1, 2, 3], ['a', 'b', 'c'])
# p interleave([1, 2, 3], ['a', 'b', 'c']) == [1, 'a', 2, 'b', 3, 'c']
