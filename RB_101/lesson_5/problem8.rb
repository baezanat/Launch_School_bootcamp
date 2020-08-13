hsh = {first: ['the', 'quick'], second: ['brown', 'fox'],
  third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

# Using the each method,
# write some code to output all of the vowels from the strings
=begin
INPUT: hash with four key-value pairs where keys are symbols and
  values are arrays.
OUTPUT: string of vowels

STRATEGY:
1. get an array of string arrays (hash.values) and flatten it
2. Iterate over the string elements in the array and select all the vowels
3. Push all the vowels into a result string
=end
result = ''
hsh.values.flatten.each do |string|
  string.each_char do |character|
    result << character if "aeiou".include?(character)
  end
end
p result
