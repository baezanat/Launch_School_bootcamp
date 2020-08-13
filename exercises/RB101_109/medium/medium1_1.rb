=begin
Write a method that rotates an array by moving the first element to the end of the array. The original array should not be modified.

Do not use the method Array#rotate or Array#rotate! for your implementation.

Example:

rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]
rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']
rotate_array(['a']) == ['a']

x = [1, 2, 3, 4]
rotate_array(x) == [2, 3, 4, 1]   # => true
x == [1, 2, 3, 4]                 # => true
=end

def rotate_array(arr)
  arr[1..-1] + [arr[0]]  # => [3, 5, 2, 9, 1, 7], ["b", "c", "a"], ["a"], [2, 3, 4, 1]
end                      # => :rotate_array

p rotate_array([7, 3, 5, 2, 9, 1]) == [3, 5, 2, 9, 1, 7]  # => true
p rotate_array(['a', 'b', 'c']) == ['b', 'c', 'a']        # => true
p rotate_array(['a']) == ['a']                            # => true

p x = [1, 2, 3, 4]   # => [1, 2, 3, 4]
p rotate_array(x)    # => [2, 3, 4, 1]
p x == [1, 2, 3, 4]  # => true

# >> true
# >> true
# >> true
# >> [1, 2, 3, 4]
# >> [2, 3, 4, 1]
# >> true
