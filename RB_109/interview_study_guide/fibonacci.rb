=begin
select the element out of the array if its index is a fibonacci number

INPUT: array
OUTPUT: array of selected elements
RULES:
  - Fibonacci series begins with 1, 1 and then every successive number is the sum of the two previous numbers
  - need to find the fibonacci numbers in range from 0 to array.size - 1, and select the elements with those indices.
  - Fibonacci series: 1, 1, 2, 3, 5, 8, 13, ...
TEST CASEs:

fibonacci_element(['a', 'b', 'c', 'd', 'e', 'f']) == ['b', 'c', 'd', 'f']
fibonacci_element([]) == []
fibonacci_element([1, 2, 44]) == [2, 44]

DATA STRUCTURES: arrays and integers
ALGORITHM:
Separate problem into 2 methods, one to test whether a number is a fibonacci number, and the other to select elements from the array with fibonacci indices.

test for fibonacci number
  - input: num
  - generate fibonacci sequence up to a number >= num
    - initialize a result array result = [1, 1]
    - loop manually
      - counter = 2
      - start loop
      - result << result[counter-1] + result[counter - 2]
      - increment counter by 1
      - add breaking condition (before appending) when result.last >= num
      - end loop
  - check if result array includes num
    - if yes, num is a fibonacci number (return true)
    - if not, num is not fibonacci (return false)

select elements from array with fibonacci indices
  - create array indices from range (1..array.size)
  - use Array#select to get a new array with indices that are fibonacci numbers
  - initialize empty result array
  - append to result array the elements in input array at selected indices
=end

def fibonacci?(num)
  result = [1, 1]
  counter = 2
  loop do
    break if result.last >= num
    result << result[counter - 1] +  result[counter - 2]
    counter += 1
  end
  result.include?(num)
end

def fibonacci_element(array)
  fibonacci_indices = ((1..array.size - 1).to_a.select do |element|
    fibonacci?(element)
  end)
  result = []
  fibonacci_indices.each { |num| result << array[num] }
  result
end

p fibonacci_element(['a', 'b', 'c', 'd', 'e', 'f']) == ['b', 'c', 'd', 'f']
p fibonacci_element([]) == []
p fibonacci_element([1, 2, 44]) == [2, 44]
