=begin
Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.
You may not use Array#reverse or Array#reverse!, nor may you use the method you wrote in the previous exercise.

INPUT: array
OUTPUT: new array in reverse order
RESTRICTIONS:
  - can't use Ruby reverse methods
  - empty array returns an empty array
DATA STRUCTURE:
  - array
ALGORITHM:
  - start an empty array
  - make a copy of the array using dup
  - iterate over the copy, use pop to remove each element and push it into the empty array
  - return the new array
=end

def reverse(arr)
  reversed = []                             # => [],           [],                        [],      [], []
  copy = arr.dup                            # => [1, 2, 3, 4], ["a", "b", "e", "d", "c"], ["abc"], [], [1, 3, 2]
  copy.size.times { reversed << copy.pop }  # => 4,            5,                         1,       0,  3
  reversed                                  # => [4, 3, 2, 1], ["c", "d", "e", "b", "a"], ["abc"], [], [2, 3, 1]
end                                         # => :reverse

reverse([1,2,3,4]) == [4,3,2,1]          # => true
reverse(%w(a b e d c)) == %w(c d e b a)  # => true
reverse(['abc']) == ['abc']              # => true
reverse([]) == []                        # => true

list = [1, 3, 2]                      # => [1, 3, 2]
new_list = reverse(list)              # => [2, 3, 1]
list.object_id != new_list.object_id  # => true
list == [1, 3, 2]                     # => true
new_list == [2, 3, 1]                 # => true
