=begin
Write a method that returns an Array that contains every other element of an Array
that is passed in as an argument. The values in the returned list should be those
values that are in the 1st, 3rd, 5th, and so on elements of the argument Array. Ex:
oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []


INPUT: array
OUPUT: array with selected values
REQUIREMENTS:
- select values at odd indexes (0, 2, etc)
- should work with any type of object (numbers, strings,etc)
- empty array should return an empty array
- should we transform the array or return a new array?

STRATEGY:
1. Create a method that takes an array as argument
2. Initialize an empty return array
3. Use #each_with_index and push into the return array all elements with an even-numbered index
4. Make sure to return the return array
=end

def oddities(arr)
  result = []
  arr.each_with_index do |element, index|
    result << element if index.even?
  end
  result
end

# p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# p oddities(['abc', 'def']) == ['abc']
# p oddities([123]) == [123]
# p oddities([]) == []

# Using a simple loop
def oddities2(arr)
  index = 0
  result = []
  loop do
    break if index >= arr.size
    result << arr[index]
    index += 2
  end
  result
end

# p oddities2([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities2([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# p oddities2(['abc', 'def']) == ['abc']
# p oddities2([123]) == [123]
# p oddities2([]) == []

# Using #fetch
def oddities3(arr)
  result = []
  index_array = (0..arr.size-1).select {|idx| idx.even?}
  index_array.each do |index|
    result << arr.fetch(index)
  end
  result
end

p oddities3([2, 3, 4, 5, 6]) == [2, 4, 6]
p oddities3([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
p oddities3(['abc', 'def']) == ['abc']
p oddities3([123]) == [123]
p oddities3([]) == []
