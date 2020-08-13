flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
# Turn this array into a hash where the names are the keys
# and the values are the positions in the array

=begin

PROBLEM
1. INPUT: array, OUTPUT: hash
2. REQUIREMENTS
  - key/value pairs will be |array element, element's index|

STRATEGY
1. Use each_with_index to iterate over the elements and the indices.
2. Return an array of arrays where each subarray has the element first and the 
index number second
3. Turn the resulting nested array into a hash

=end

names_and_indices = {}
flintstones.each_with_index do |name, index|
  names_and_indices[name] = index
end
p names_and_indices
