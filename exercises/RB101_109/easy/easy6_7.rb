=begin
Write a method that takes an Array as an argument, and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively. If the original array contains an odd number of elements, the middle element should be placed in the first half Array.

Examples:
halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
halvsies([5]) == [[5], []]
halvsies([]) == [[], []]

INPUT: array
OUTPUT: array with 2 inner arrays
RESTRICTIONS:
  - If input array has even # of elements, return two inner arrays with same size
  - If IA has odd # of elements, return first array with half + 1 number of elements
  - If IA.size = 1, return array with IA and empty array
  - If IA.empty? return array with 2 empty inner arrays
=end

def halvsies(arr)
  new = []                   # => [],    [],    [],    []
  mid = arr.size/2           # => 2,     2,     0,     0
  if arr.size == 0           # => false, false, false, true
    2.times { new << []  }   # => 2
  elsif arr.size == 1        # => false, false, true
    new << arr               # => [[5]]
    new << []                # => [[5], []]
  elsif arr.size.even?       # => true, false
    new << arr[0..mid - 1]   # => [[1, 2]]
    new << arr[mid..-1]      # => [[1, 2], [3, 4]]
  elsif arr.size.odd?        # => true
    new << arr[0..mid]       # => [[1, 5, 2]]
    new << arr[mid + 1..-1]  # => [[1, 5, 2], [4, 3]]
  end                        # => [[1, 2], [3, 4]], [[1, 5, 2], [4, 3]], [[5], []], 2
  new                        # => [[1, 2], [3, 4]], [[1, 5, 2], [4, 3]], [[5], []], [[], []]
end                          # => :halvsies


halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]        # => true
halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]  # => true
halvsies([5]) == [[5], []]                        # => true
halvsies([]) == [[], []]                          # => true
