vehicles = [
  'car', 'caR', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'Motorcycle', 'car', 'TRUCK'
]

# Write a method that counts the number of occurrences of each element in a given array.
# The words in the array are case-sensitive: 'suv' != 'SUV'.
# Once counted, print each element alongside the number of occurrences.
=begin

INPUT: array
OUTPUT: Print a string with each element and number of occurrences
STRATEGY:
1. Create method that
2. Iterates over the array and for each element uses array.count(element) to return the number of elements and
3. outputs a string with 'element: number'
=end
=begin
def count_occurrences(arr)
  hsh = {}
  arr.each do |element|
    hsh[element] = arr.count(element)
  end
  hsh.each do |key, value| 
    puts "#{key}: #{value}"
  end
end

count_occurrences(vehicles)
=end

# Non-case-sensitive solution (suv == SUV)
def count_occurrences(arr)
  hsh = {}
  arr.each do |element|
    element.downcase!
    hsh[element] = arr.count(element)
  end
  hsh.each do |key, value| 
    puts "#{key}: #{value}"
  end
end

count_occurrences(vehicles)
