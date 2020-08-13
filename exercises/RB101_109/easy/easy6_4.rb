=begin
Write a method that takes an Array as an argument, and reverses its elements in place; that is, mutate the Array passed into this method. The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

Examples:
list = [1,2,3,4]
result = reverse!(list)
result == [4, 3, 2, 1]
list == [4, 3, 2, 1]
list.object_id == result.object_id

list = %w(a b e d c)
reverse!(list) == ["c", "d", "e", "b", "a"]
list == ["c", "d", "e", "b", "a"]

list = ['abc']
reverse!(list) == ["abc"]
list == ["abc"]

list = []
reverse!(list) == []
list == []

INPUT: array
OUTPUT: same array in reverse
RESTRICTIONS:
  - same object
  - do not reverse strings within the array
  - empty array returns empty array
DATA STRUCTURE: array
ALGORITHM:
  - Iterate over the array shifting each element and pushing it into the array until the first element is the previous last element
=end

def reverse!(arr)
  arr2 = arr.clone
  arr.each_index do |idx|
    arr[idx] = arr2[-idx - 1]
  end
  arr
end

reverse!([])
reverse!([1, 2, 3, 4])
reverse!(['a', 'b', 'c', 'd'])
reverse!(['abc'])
