arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}],
[{a: 1, b: 2, c: 3, d: 4}, 'D']]
# Given the following data structure, and without using the Array#to_h method,
# write some code that will return a hash where
# the key is the first item in each sub array and the value is the second item.

# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, 
# {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

=begin
INPUT: array with four inner arrays
OUPTPUT: hash
STRATEGY:
1. iterate over the array. Current element = inner_array
2. Use #each_with_object on the inner_array with a hash as argument to
  populate the hash with key-value pairs where key=inner_array[0] and value
  is inner_array[1]
=end

hsh = arr.each_with_object({}) do |subarray, hsh|
  hsh[subarray[0]] = subarray[1]
end

p hsh
