=begin
reverse an array without using the built-in reverse method

INPUT: array
OUTPUT: (modified) array
RULES:
  - same Aray object or a new array?
  - elements in reverse order
DATA STRUCTURE: array
ALGORITHM:
  - initiate an empty result array
  - iterate over input array and append the last element from the input array (using Array#pop) to the result array (using <<)
  - make sure method returns the result array
=end

def reverser(arr)
  result = []
  arr.size.times { |element| result << arr.pop }
  result
end

# p reverser(['a', 'bob', 'cal']) == ['cal', 'bob', 'a']
# p reverser([]) == []
# p reverser([1, 2, 3]) == [3, 2, 1]
# p reverser([['ted', 'anna']]) == [['ted', 'anna']]

=begin
Now do the same without modifying the original array.

ALGORITHM:
- initiate an empty result array
- counter = -1
- manual loop
- result << array[counter]
- reduce counter by 1 in each iteration
- break when counter = -array.size
=end

def reverser2(arr)
  result = []
  counter = arr.size - 1
  loop do
    break if counter < 0
    result << arr[counter]
    counter -= 1
  end
  result
end

p reverser2(['a', 'bob', 'cal']) == ['cal', 'bob', 'a']
p reverser2([]) == []
p reverser2([1, 2, 3]) == [3, 2, 1]
p reverser2([['ted', 'anna']]) == [['ted', 'anna']]
