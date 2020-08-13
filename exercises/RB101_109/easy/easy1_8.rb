=begin
Write a method that takes one argument, an array containing integers, and returns
the average of all numbers in the array. The array will never be empty and the
numbers will always be positive integers. Examples (should all return true):
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

INPUT: array containing integers
OUTPUT: float (average of all the numbers in the array)
REQUIREMENTS:
- array never empty (what to do if an empty array is passed?)
- only positive integers (test for this and do what if there is a num <= 0?)

STRATEGY:
- Create a method that calls #sum on the array, returning an integer, and then
- divides the integer by the size of the array, and returns this number.
- If the array is empty or there are num <= 0, the method puts an error.
=end

def average(arr)
  if arr.empty?
    puts "Invalid input. Enter a non-empty array."
  elsif !arr.all? {|num| num > 0}
    puts "Invalid input. Only positive integers are allowed."
  else
    arr.sum.to_f/arr.size
  end
end

puts average([3, 4])
puts average([1, 5, 87, 45, 8, 8])
puts average([9, 47, 23, 95, 16, 52])
puts average([])
puts average([0, 3, 5])
