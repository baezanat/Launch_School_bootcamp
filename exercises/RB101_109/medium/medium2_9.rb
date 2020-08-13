=begin
Bubble Sort is one of the simplest sorting algorithms available. It isn't an efficient algorithm, but it's a great exercise for student developers. In this exercise, you will write a method that does a bubble sort of an Array.

A bubble sort works by making multiple passes (iterations) through the Array. On each pass, each pair of consecutive elements is compared. If the first of the two elements is greater than the second, then the two elements are swapped. This process is repeated until a complete pass is made without performing any swaps; at that point, the Array is completely sorted.

Write a method that takes an Array as an argument, and sorts that Array using the bubble sort algorithm as just described. Note that your sort will be "in-place"; that is, you will mutate the Array passed as an argument. You may assume that the Array contains at least 2 elements.

Examples

array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)

INPUT: array
OUTPUT: sorted array
RULES:
  - iterate through the array using Array#each_with_index
  - compare each element with array[index + 1] using #<=>
  - if result is 1
    - arr.delete(element)
      arr.insert(index + 1, element)
  - if the array after iteration is equal to the array before iteration, return the array. Otherwise, repeat iteration process.
=end

def bubble_sort!(array)
  loop do
    swapped = false
    array.each_with_index do |element, index|
      if (element <=> array[index + 1]) == 1
        array.delete(element)
        array.insert(index + 1, element)
        swapped = true
      end
    end
    break if swapped == false
  end
  array
end

# def bubble_sort!(array)
#   loop do
#     array.each_with_index do |element, index|
#       if (element <=> array[index + 1]) == 1
#         array.delete(element)
#         array.insert(index + 1, element)
#       end
#     end
#     comparison_array = (array.map.with_index do |element, index|
#       element <=> array[index + 1]
#     end)
#     comparison_array.pop #delete last element which will always bee nil
#     break if comparison_array.all? { |num| num < 1 }
#   end
#   array
# end

p bubble_sort!([5, 3]) # => [3, 5]
array = [6, 2, 7, 1, 4] # => [6, 2, 7, 1, 4]
bubble_sort!(array) # => [1, 2, 4, 6, 7]
array == [1, 2, 4, 6, 7] # => true
array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie) # => ["Sue", "Pete", "Alice", "Tyler", "Rachel", "Kim", "Bonnie"]
bubble_sort!(array) # => ["Alice", "Bonnie", "Kim", "Pete", "Rachel", "Sue", "Tyler"]
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler) # => true

# >> [3, 5]
