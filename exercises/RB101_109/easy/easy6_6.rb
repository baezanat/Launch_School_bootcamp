=begin
Write a method that takes two Arrays as arguments, and returns an Array that contains all of the values from the argument Arrays. There should be no duplication of values in the returned Array, even if there are duplicates in the original Arrays.

Example:
merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

INPUT: 2 arrays
OUTPUT: single array
ALGORITHM:
  - concatenate the arrays with + and use #uniq
=end

def merge(arr_1, arr_2)
  (arr_1 + arr_2).uniq   # => [1, 3, 5, 2, 6]
end                      # => :merge

merge([1, 3, 5], [2, 3, 6])  # => [1, 3, 5, 2, 6]
