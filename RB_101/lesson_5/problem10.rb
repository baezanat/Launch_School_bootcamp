arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

# without modifying the original array, use the map method to return
# a new array identical in structure to the original but where the value
# of each integer is incremented by 1.

=begin
INPUT: array with three inner hashes
OUTPUT: same structure but with each integer incremented by 1.
STRATEGY:
1. Use #map to iterate over the array. Current element = inner_hash
2. Use inner_hash.transform_values with a block that increments each by one
=end

plus_one = arr.map do |inner_hash|
  inner_hash.transform_values do |num|
    num += 1
  end
end

p plus_one
p arr
