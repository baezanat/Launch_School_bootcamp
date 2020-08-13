=begin
Write a method that takes an Array of numbers, and returns an Array with the same
number of elements, and each element has the running total from the original Array.
ex:
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []

INPUT: array
OUTPUT: array where each number (except at idx 0) is the sum of the previous num + itself
REQUIREMENTS: 
  - if given an empty array, return an empty array.
  - if given a single element array, return the same array.
DATA STRUCTURE: array
STRATEGY:
  - iterate over the elements in the array
  - for idx > 0, element[idx] = element [idx - 1] + element[idx]
  - use #map to return the transformed array
=end
=begin
def running_total(arr)
  return arr if arr.empty?
  new_arr = []
  new_arr << arr[0]
  counter = 1
  loop do
    break if counter >= arr.size
    new_arr[counter] = new_arr[counter - 1] + arr[counter]
    counter += 1
  end
  new_arr
end

def running_total(arr)
  sum = 0
  arr.map { |num| sum += num }
end
=end
=begin
def running_total(arr)
  num_arr = []
  new_arr = []
  arr.each do |num|
    num_arr << num
    new_arr << num_arr.reduce(:+)
  end
  new_arr
end
=end

def running_total(arr)
  arr.each_with_index.map { |_, idx| arr.take(idx+1).reduce(:+) }
end
=begin
def running_total(arr)
  sum = 0
  arr.each_with_object([]) do |num, new_arr|
    new_arr << sum += num
  end
end
=end

p "If the array is [1,2,3], the result is #{running_total([1,2,3])}."
p "If the array is [2, 5, 13], the result is #{running_total([2, 5, 13])}."
p "If the array is [14, 11, 7, 15, 20], the result is #{running_total([14, 11, 7, 15, 20])}."
p "If the array is [3], the result is #{running_total([3])}."
p "If the array is [], the result is #{running_total([])}."
